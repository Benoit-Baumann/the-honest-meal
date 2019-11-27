// Listen for the click on the login modal's tabs
const initTabListener = () => {

    let sessionTab = document.querySelector('#tab-session');
    let registrationTab = document.querySelector('#tab-registration');

    let sessionForm = document.querySelector('#session-form');
    let registrationForm = document.querySelector('#registration-form');

    if (registrationTab) {
        registrationTab.addEventListener('click', () => {
            registrationTab.classList.add('active');
            registrationForm.classList.add('active');
            sessionTab.classList.remove('active');
            sessionForm.classList.remove('active');
        })
    }

    if (sessionTab) {
        sessionTab.addEventListener('click', () => {
            sessionTab.classList.add('active');
            sessionForm.classList.add('active');
            registrationTab.classList.remove('active');
            registrationForm.classList.remove('active');
        })
    }
}

// Listen for the click on the button 'Join Us' to open the login modal
const initMainSignupBtnListener = () => {
    let mainModalOpener = document.querySelector('#main-login-opener')
    let navbarModalOpener = document.querySelector('#navbar-login-opener')

    if (mainModalOpener) {
        mainModalOpener.addEventListener('click', () =>{
            navbarModalOpener.click();
        })
    }
}

// Listen for the click on 'Envoyer un questionnaire' button
const initSendReviewBtnListener = () => {
    let sendReviewBtn = document.querySelector('#share-review-summary')

    if (sendReviewBtn){
        sendReviewBtn.addEventListener('click', () => {

            if (sendReviewBtn.parentNode.hasAttribute("open")){
                sendReviewBtn.classList.remove('active');
            } else {
                sendReviewBtn.classList.add('active');
            }

            let feedbackMsg = document.querySelector('.feedback-msg');
            if (feedbackMsg){
                feedbackMsg.innerHTML = "";
                feedbackMsg.className = "feedback-msg";
            }
        })
    }
}

export { initTabListener, initMainSignupBtnListener, initSendReviewBtnListener }