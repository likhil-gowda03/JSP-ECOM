document.addEventListener('DOMContentLoaded', function () {
  if (typeof AOS !== 'undefined') {
    AOS.init({
      duration: 700,
      once: true,
      offset: 80,
    });
  }

  var imageInput = document.getElementById('imgInp');
  var previewImage = document.getElementById('blah');
  if (imageInput && previewImage) {
    imageInput.addEventListener('change', function () {
      var file = imageInput.files && imageInput.files[0];
      if (file) {
        previewImage.src = URL.createObjectURL(file);
      }
    });
  }

  document.querySelectorAll('.js-btn-minus').forEach(function (button) {
    button.addEventListener('click', function (event) {
      event.preventDefault();
      var wrapper = button.closest('.input-group');
      var input = wrapper ? wrapper.querySelector('input[type="text"], input[type="number"]') : null;
      if (!input) return;
      var current = parseInt(input.value || '0', 10);
      if (!isNaN(current) && current > 1) {
        input.value = current - 1;
        input.dispatchEvent(new Event('change', { bubbles: true }));
      }
    });
  });

  document.querySelectorAll('.js-btn-plus').forEach(function (button) {
    button.addEventListener('click', function (event) {
      event.preventDefault();
      var wrapper = button.closest('.input-group');
      var input = wrapper ? wrapper.querySelector('input[type="text"], input[type="number"]') : null;
      if (!input) return;
      var current = parseInt(input.value || '0', 10);
      input.value = isNaN(current) ? 1 : current + 1;
      input.dispatchEvent(new Event('change', { bubbles: true }));
    });
  });

  var carousel = window.jQuery && window.jQuery('.nonloop-block-3');
  if (carousel && carousel.length && typeof carousel.owlCarousel === 'function') {
    carousel.owlCarousel({
      center: false,
      items: 1,
      loop: true,
      margin: 28,
      autoplay: true,
      autoplayTimeout: 4500,
      smartSpeed: 700,
      stagePadding: 10,
      dots: true,
      nav: true,
      responsive: {
        0: { items: 1 },
        768: { items: 2 },
        1100: { items: 3 },
      },
    });
  }

  var menuToggle = document.querySelector('.js-menu-toggle');
  if (menuToggle) {
    menuToggle.addEventListener('click', function (event) {
      event.preventDefault();
      document.body.classList.toggle('offcanvas-menu');
    });
  }
});