import { supabase } from './supabase-client.js';

document.addEventListener('DOMContentLoaded', async () => {
    try {
        const { data: categories, error: errCat } = await supabase.from('works_categories').select('*').order('order_index');
        if (errCat) throw errCat;

        const { data: works, error: errWorks } = await supabase.from('works').select('*, category:works_categories(slug, label)').order('order_index');
        if (errWorks) throw errWorks;

        if (!categories || !works) return;

        // Renderizar Filtros
        const filtersContainer = document.querySelector('.cat-filters');
        if (filtersContainer) {
            filtersContainer.innerHTML = '';
            
            // "Todos" button
            const allBtn = document.createElement('button');
            allBtn.className = 'cat-filter active';
            allBtn.dataset.filter = 'todos';
            allBtn.textContent = 'Todos';
            filtersContainer.appendChild(allBtn);

            // Dynamic categories buttons
            categories.forEach(cat => {
                const btn = document.createElement('button');
                btn.className = 'cat-filter';
                btn.dataset.filter = cat.slug;
                btn.textContent = cat.label;
                filtersContainer.appendChild(btn);
            });
        }

        // Renderizar Cards
        const grid = document.getElementById('products-grid') || document.querySelector('.products-grid');
        if (grid) {
            grid.innerHTML = '';
            works.forEach((item, i) => {
                const delay = (i % 3) * 0.1;
                const card = document.createElement('a');
                card.href = 'javascript:void(0)';
                card.className = 'product-card reveal';
                // Remove the opacity/y styles so GSAP can handle it
                card.dataset.delay = delay;
                card.dataset.category = item.category?.slug || '';
                card.dataset.name = item.name;
                card.dataset.origin = item.category?.label || '';
                card.dataset.img = item.image_url;
                card.dataset.desc = item.description || '';
                card.onclick = function() { if(window.openModal) window.openModal(this); };
                
                card.innerHTML = `
                <div class="product-card-img reveal-img">
                    <img src="${item.image_url}" alt="${item.name}" loading="lazy" onerror="this.src='assets/img/placeholder.png'">
                </div>
                <div class="product-card-info">
                    <p class="product-card-name">${item.name}</p>
                    <p class="product-card-origin">${item.category?.label || ''}</p>
                </div>
                `;
                grid.appendChild(card);
            });
        }

        // Refazer as lógicas de filter manual (pois as do main.js já rodaram)
        const filters = document.querySelectorAll('.cat-filter');
        const allCards = document.querySelectorAll('.products-grid .product-card');

        filters.forEach((btn) => {
            btn.addEventListener('click', () => {
                filters.forEach(f => f.classList.remove('active'));
                btn.classList.add('active');

                const filterVal = btn.dataset.filter;

                allCards.forEach((card) => {
                    const cat = card.dataset.category || '';

                    if (filterVal === 'todos' || cat === filterVal) {
                        card.style.display = '';
                        if (typeof gsap !== 'undefined') {
                            gsap.fromTo(card, { opacity: 0, y: 30 }, { opacity: 1, y: 0, duration: 0.5, ease: 'power3.out' });
                        }
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });

        // Re-initialize GSAP
        if (typeof gsap !== 'undefined' && typeof ScrollTrigger !== 'undefined') {
            gsap.utils.toArray('.product-card.reveal').forEach((el) => {
                gsap.fromTo(el,
                    { y: 50, opacity: 0 },
                    { y: 0, opacity: 1, duration: 1, delay: parseFloat(el.dataset.delay) || 0, ease: 'power3.out',
                      scrollTrigger: { trigger: el, start: 'top 88%', once: true } }
                );
            });
            gsap.utils.toArray('.reveal-img').forEach((el) => {
                gsap.fromTo(el,
                    { clipPath: 'inset(100% 0 0 0)' },
                    { clipPath: 'inset(0% 0 0 0)', duration: 1.2, ease: 'power4.out',
                      scrollTrigger: { trigger: el, start: 'top 85%', once: true } }
                );
            });
        }
    } catch(err) {
        console.error('Error loading works portfolio:', err);
    }
});
