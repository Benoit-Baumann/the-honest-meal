const clickPlus = (event) => {
  content = event.currentTarget.parentNode.querySelector('.review-content-smooth')
  min = event.currentTarget.parentNode.querySelector('.fa-minus-circle')
  plus = event.currentTarget.parentNode.querySelector('.fa-plus-circle')

  plus.classList.add('hidden');
  min.classList.remove('hidden');
  content.classList.remove('height0');
}

const clickMin = (event) => {
  content = event.currentTarget.parentNode.querySelector('.review-content-smooth')
  min = event.currentTarget.parentNode.querySelector('.fa-minus-circle')
  plus = event.currentTarget.parentNode.querySelector('.fa-plus-circle')

  plus.classList.remove('hidden');
  min.classList.add('hidden');
  content.classList.add('height0');
}


document.querySelectorAll(".fa-plus-circle").forEach((elem) => {
  elem.addEventListener("click", clickPlus);
});

document.querySelectorAll(".fa-minus-circle").forEach((elem) => {
  elem.addEventListener("click", clickMin);
});
