document.querySelectorAll(".fa-plus-circle.chart-text").forEach((elem) => {
  elem.addEventListener("click", (event) => {
    elem.nextElementSibling.classList.remove('hidden');
    elem.classList.add('hidden');
  });
});

document.querySelectorAll(".fa-minus-circle.chart-text").forEach((elem) => {
  elem.addEventListener("click", (event) => {
    elem.parentNode.classList.add('hidden');
    elem.parentNode.previousElementSibling.classList.remove('hidden');
  });
});


document.querySelectorAll(".fa-plus-circle.chart-rating").forEach((elem) => {
  elem.addEventListener("click", (event) => {
    elem.nextElementSibling.classList.remove('hidden');
    elem.classList.add('hidden');
  });
});


document.querySelectorAll(".fa-minus-circle.chart-rating").forEach((elem) => {
  elem.addEventListener("click", (event) => {
    elem.parentNode.classList.add('hidden');
    elem.parentNode.previousElementSibling.classList.remove('hidden');
  });
});
