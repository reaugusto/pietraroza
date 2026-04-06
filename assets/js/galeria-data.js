import { supabase } from './supabase-client.js';

document.addEventListener('DOMContentLoaded', async () => {
    try {
        const { data: categories, error: errCat } = await supabase.from('materials_categories').select('*').order('order_index');
        if (errCat) throw errCat;

        const { data: materials, error: errMat } = await supabase.from('materials').select('*, category:materials_categories(slug, label)').order('order_index');
        if (errMat) throw errMat;

        if (!categories || !materials) return;

        // Limpa a nav e as seções estáticas se quisermos montar dinamicamente
        const catNavInner = document.querySelector('.cat-nav-inner');
        if (catNavInner) {
            catNavInner.innerHTML = '';
        }

        // Remover as seções collection-section hardcoded para não duplicar, as geramos do DB
        document.querySelectorAll('.collection-section').forEach(el => el.remove());

        const mainContainer = document.querySelector('main');
        const ctaSection = document.querySelector('.cta-section');

        categories.forEach((cat, index) => {
            // Cria a seção no main
            const section = document.createElement('div');
            section.className = 'collection-section';
            section.id = cat.slug;
            if (index % 2 !== 0) {
                section.style.background = 'var(--bg-light)';
            }
            section.innerHTML = `
                <div class="collection-header reveal">
                    <h2>${cat.label}</h2>
                </div>
                <div class="products-grid" id="${cat.slug}-grid"></div>
            `;
            if (ctaSection) {
                mainContainer.insertBefore(section, ctaSection);
            } else {
                mainContainer.appendChild(section);
            }

            const grid = document.getElementById(`${cat.slug}-grid`);
            const items = materials.filter(m => m.category_id === cat.id);

            // Adiciona no sticky nav
            if (catNavInner) {
                const sampleThumb = items.length > 0 ? items[0].image_url : 'assets/img/placeholder.png';
                const navItem = document.createElement('a');
                navItem.href = `#${cat.slug}`;
                navItem.className = `cat-nav-item ${index === 0 ? 'active' : ''}`;
                navItem.dataset.section = cat.slug;
                navItem.innerHTML = `
                    <div class="cat-nav-thumb"><img src="${sampleThumb}" alt="" onerror="this.src='assets/img/placeholder.png'"></div>
                    ${cat.label}
                `;
                catNavInner.appendChild(navItem);
            }

            items.forEach((item, i) => {
                const delay = (i % 3) * 0.1;
                const card = document.createElement('a');
                card.href = 'javascript:void(0)';
                card.className = 'product-card reveal';
                card.dataset.delay = delay;
                card.dataset.name = item.name;
                card.dataset.origin = cat.label;
                card.dataset.img = item.image_url;
                card.dataset.desc = item.description || '';
                card.onclick = function() { if(window.openModal) window.openModal(this); };
                
                card.innerHTML = `
                <div class="product-card-img reveal-img">
                    <img src="${item.image_url}" alt="${item.name}" loading="lazy" onerror="this.src='assets/img/placeholder.png'">
                </div>
                <div class="product-card-info">
                    <p class="product-card-name">${item.name}</p>
                    <p class="product-card-origin">${cat.label}</p>
                </div>
                `;
                grid.appendChild(card);
            });
        });

        // Reforça o event listener de intersection observer para a nova nav
        const navItems = document.querySelectorAll('.cat-nav-item[data-section]');
        const sections = [];
        navItems.forEach(item => {
            const id = item.dataset.section;
            const sec = document.getElementById(id);
            if (sec) sections.push({ id, el: sec, navItem: item });
        });
        if (typeof IntersectionObserver !== 'undefined' && sections.length) {
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        navItems.forEach(n => n.classList.remove('active'));
                        const match = sections.find(s => s.el === entry.target);
                        if (match) match.navItem.classList.add('active');
                    }
                });
            }, { rootMargin: '-40% 0px -50% 0px' });
            sections.forEach(s => observer.observe(s.el));
        }

        // Re-initialize GSAP for dynamically added elements
        if (typeof gsap !== 'undefined' && typeof ScrollTrigger !== 'undefined') {
            gsap.utils.toArray('.collection-section .reveal').forEach((el) => {
                gsap.from(el, {
                    scrollTrigger: { trigger: el, start: 'top 88%', once: true },
                    y: 50, opacity: 0, duration: 1,
                    delay: el.dataset.delay ? parseFloat(el.dataset.delay) : 0,
                    ease: 'power3.out',
                });
            });
            gsap.utils.toArray('.collection-section .reveal-img').forEach((el) => {
                gsap.fromTo(el,
                    { clipPath: 'inset(100% 0 0 0)' },
                    { clipPath: 'inset(0% 0 0 0)', duration: 1.2, ease: 'power4.out',
                    scrollTrigger: { trigger: el, start: 'top 85%', once: true } }
                );
            });
        }
    } catch(err) {
        console.error('Error loading materials gallery data:', err);
    }
});
