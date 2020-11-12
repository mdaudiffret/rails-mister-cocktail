import Typed from 'typed.js';

const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-blue');
      } else {
        navbar.classList.remove('navbar-blue');
      }
    });
  }
}


const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Mojito", "Cuba libre", "Piña colada"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
export { initUpdateNavbarOnScroll };
