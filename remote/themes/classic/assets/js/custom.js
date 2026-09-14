document.addEventListener('DOMContentLoaded', function() {
  const fadeInElements = document.querySelectorAll('.fade-in');
  const headerNav = document.querySelector('.header-nav');

  const checkVisibility = () => {
    fadeInElements.forEach(element => {
      const rect = element.getBoundingClientRect();
      if (rect.top <= window.innerHeight && rect.bottom >= 0) {
        element.classList.add('is-visible');
      }
    });
  };

  const handleScroll = () => {
    if (window.scrollY > 50) {
      headerNav.classList.add('scrolled');
    } else {
      headerNav.classList.remove('scrolled');
    }
    checkVisibility();
  };

  window.addEventListener('scroll', handleScroll);
  checkVisibility(); 
});
