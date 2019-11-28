document.querySelectorAll('.connected-btn2').forEach((btn) => {
  btn.addEventListener("click", (event) => {
  btn.classList.add('hidden');
  btn.nextElementSibling.classList.remove('hidden');
});
});

