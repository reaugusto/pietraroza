/* ==============================================
   PIETRA ROZA v2 — MAIN JS
   Cursor, Lenis, GSAP ScrollTrigger, Page Curtain
   ============================================== */

document.addEventListener('DOMContentLoaded', () => {

  // ─── CURSOR PERSONALIZADO ───
  const cursor = document.getElementById('custom-cursor');
  if (cursor) {
    let mouseX = -100, mouseY = -100;
    let curX = -100, curY = -100;

    document.addEventListener('mousemove', (e) => {
      mouseX = e.clientX;
      mouseY = e.clientY;
    });

    // Smoothed cursor follow
    const animateCursor = () => {
      curX += (mouseX - curX) * 0.12;
      curY += (mouseY - curY) * 0.12;
      cursor.style.left = curX + 'px';
      cursor.style.top  = curY + 'px';
      requestAnimationFrame(animateCursor);
    };
    animateCursor();

    // Hover expandido em elementos interativos
    const interactables = document.querySelectorAll('a, button, .product-card, .project-list-item, .cat-filter');
    interactables.forEach(el => {
      el.addEventListener('mouseenter', () => cursor.classList.add('expanded'));
      el.addEventListener('mouseleave', () => cursor.classList.remove('expanded'));
    });

    // Cursor em modo claro sobre hero escuro
    const heroDark = document.querySelector('.hero-fullscreen');
    if (heroDark) {
      heroDark.addEventListener('mouseenter', () => cursor.classList.add('on-dark'));
      heroDark.addEventListener('mouseleave', () => cursor.classList.remove('on-dark'));
    }
  }

  // ─── LENIS SMOOTH SCROLL ───
  let lenis;
  if (typeof Lenis !== 'undefined') {
    lenis = new Lenis({
      duration: 1.2,
      easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
      smooth: true,
    });

    const raf = (time) => {
      lenis.raf(time);
      requestAnimationFrame(raf);
    };
    requestAnimationFrame(raf);

    // Integração com GSAP ScrollTrigger
    if (typeof gsap !== 'undefined' && typeof ScrollTrigger !== 'undefined') {
      lenis.on('scroll', ScrollTrigger.update);
      gsap.ticker.add((time) => { lenis.raf(time * 1000); });
      gsap.ticker.lagSmoothing(0);
    }
  }

  // ─── GSAP ANIMAÇÕES ───
  if (typeof gsap !== 'undefined') {
    gsap.registerPlugin(ScrollTrigger);

    // Intro da página (itens que entram ao carregar)
    const introEls = document.querySelectorAll('.intro-anim');
    if (introEls.length) {
      gsap.from(introEls, {
        duration: 1.2,
        y: 60,
        opacity: 0,
        stagger: 0.12,
        ease: 'power4.out',
        delay: 0.3,
      });
    }

    // Hero: parallax na imagem de fundo
    const heroBg = document.querySelector('.hero-bg');
    if (heroBg) {
      gsap.to(heroBg, {
        yPercent: 25,
        ease: 'none',
        scrollTrigger: {
          trigger: '.hero-fullscreen',
          start: 'top top',
          end: 'bottom top',
          scrub: true,
        }
      });
    }

    // Hero card entrada
    const heroCard = document.querySelector('.hero-project-card');
    if (heroCard) {
      gsap.from(heroCard, {
        y: 40,
        opacity: 0,
        duration: 1.4,
        delay: 0.8,
        ease: 'power4.out',
      });
    }

    // Scroll reveal: elementos .reveal via ScrollTrigger
    gsap.utils.toArray('.reveal').forEach((el, i) => {
      gsap.from(el, {
        scrollTrigger: {
          trigger: el,
          start: 'top 88%',
          once: true,
        },
        y: 50,
        opacity: 0,
        duration: 1,
        delay: el.dataset.delay ? parseFloat(el.dataset.delay) : 0,
        ease: 'power3.out',
      });
    });

    // Scroll reveal: imagens com clip-path
    gsap.utils.toArray('.reveal-img').forEach((el) => {
      gsap.fromTo(el,
        { clipPath: 'inset(100% 0 0 0)' },
        {
          clipPath: 'inset(0% 0 0 0)',
          duration: 1.2,
          ease: 'power4.out',
          scrollTrigger: {
            trigger: el,
            start: 'top 85%',
            once: true,
          },
        }
      );
    });

    // Título monumental: split por linha
    const bigTitles = document.querySelectorAll('.section-title, .cta-title');
    bigTitles.forEach((title) => {
      if (typeof SplitType !== 'undefined') {
        const split = new SplitType(title, { types: 'lines' });
        gsap.from(split.lines, {
          scrollTrigger: { trigger: title, start: 'top 85%', once: true },
          y: '110%',
          opacity: 0,
          stagger: 0.06,
          duration: 1,
          ease: 'power4.out',
        });
      }
    });
  }

  // ─── NAVEGAÇÃO: HERO MODE ───
  const nav = document.querySelector('.site-nav');
  const hero = document.querySelector('.hero-fullscreen');

  if (nav && hero) {
    nav.classList.add('hero-mode');

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          nav.classList.add('hero-mode');
        } else {
          nav.classList.remove('hero-mode');
        }
      },
      { threshold: 0.1 }
    );
    observer.observe(hero);
  }

  // ─── TRANSIÇÃO DE PÁGINA (CORTINA) ───
  const curtain = document.getElementById('page-curtain');

  // Saída ao clicar em links internos
  document.querySelectorAll('a[href]').forEach((link) => {
    const href = link.getAttribute('href');
    if (!href || href.startsWith('#') || href.startsWith('http') || href.startsWith('mailto') || href.startsWith('javascript:')) return;
    if (link.hasAttribute('onclick')) return;

    link.addEventListener('click', (e) => {
      e.preventDefault();
      if (curtain && typeof gsap !== 'undefined') {
        gsap.fromTo(curtain,
          { scaleY: 0, transformOrigin: 'top' },
          {
            scaleY: 1,
            duration: 0.6,
            ease: 'power4.in',
            onComplete: () => { window.location.href = href; }
          }
        );
      } else {
        window.location.href = href;
      }
    });
  });

  // Entrada após navegação
  if (curtain && typeof gsap !== 'undefined') {
    gsap.fromTo(curtain,
      { scaleY: 1, transformOrigin: 'bottom' },
      { scaleY: 0, duration: 0.7, delay: 0.1, ease: 'power4.out' }
    );
  }

  // ─── FILTROS DE CATEGORIA ───
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

  // ─── MENU MOBILE FULLSCREEN LATERAL ───
  const navToggle = document.querySelector('.nav-toggle');
  const mobileMenu = document.querySelector('.mobile-menu');
  const mobileOverlay = document.querySelector('.mobile-menu-overlay');

  function openMobileMenu() {
    if (!navToggle || !mobileMenu) return;
    navToggle.classList.add('active');
    mobileMenu.classList.add('active');
    if (mobileOverlay) mobileOverlay.classList.add('active');
    document.body.classList.add('menu-open');
  }

  function closeMobileMenu() {
    if (!navToggle || !mobileMenu) return;
    navToggle.classList.remove('active');
    mobileMenu.classList.remove('active');
    if (mobileOverlay) mobileOverlay.classList.remove('active');
    document.body.classList.remove('menu-open');
  }

  if (navToggle) {
    navToggle.addEventListener('click', () => {
      if (mobileMenu && mobileMenu.classList.contains('active')) {
        closeMobileMenu();
      } else {
        openMobileMenu();
      }
    });
  }

  // Fechar ao clicar no overlay
  if (mobileOverlay) {
    mobileOverlay.addEventListener('click', closeMobileMenu);
  }

  // Fechar ao clicar em um link do menu mobile
  document.querySelectorAll('.mobile-menu-links a').forEach(link => {
    link.addEventListener('click', () => {
      setTimeout(closeMobileMenu, 150);
    });
  });

});

/* ─── FUNÇÕES GLOBAIS: MODAL ─── */
function openModal(el) {
  const modal = document.getElementById('stoneModal');
  if (!modal) return;

  const img = document.getElementById('modalImg');
  const name = document.getElementById('modalName');
  const origin = document.getElementById('modalOrigin');
  const desc = document.getElementById('modalDesc');
  const label = document.getElementById('modalLabel');

  img.src = el.dataset.img || '';
  img.alt = el.dataset.name || '';
  name.textContent = el.dataset.name || '';
  origin.textContent = el.dataset.origin || '';
  desc.textContent = el.dataset.desc || '';
  if (label) label.textContent = el.dataset.origin || 'Pedra Natural';

  modal.classList.add('active');
  document.body.style.overflow = 'hidden';
}

function closeModal() {
  const modal = document.getElementById('stoneModal');
  if (!modal) return;

  modal.classList.remove('active');
  document.body.style.overflow = '';
}

// Fechar modal/menu com ESC
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') {
    closeModal();
    const toggle = document.querySelector('.nav-toggle');
    const menu = document.querySelector('.mobile-menu');
    if (menu && menu.classList.contains('active')) {
      toggle?.classList.remove('active');
      menu.classList.remove('active');
      document.querySelector('.mobile-menu-overlay')?.classList.remove('active');
      document.body.classList.remove('menu-open');
    }
  }
});
