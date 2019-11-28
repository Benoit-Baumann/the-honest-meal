const initQuestionTypeBtnListener = () => {
    let ratingTypeCard = document.querySelector('#check-card-rating');
    let textTypeCard = document.querySelector('#check-card-text');
    
    if (ratingTypeCard && textTypeCard){

        ratingTypeCard.addEventListener('click', () => {
            ratingTypeCard.classList.add('selected');
            textTypeCard.classList.remove('selected');
        })

        textTypeCard.addEventListener('click', () => {
            ratingTypeCard.classList.remove('selected');
            textTypeCard.classList.add('selected');
        })
    }
}

export { initQuestionTypeBtnListener }