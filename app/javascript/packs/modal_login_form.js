const initTabListener = () => {
    const sessionTab = document.querySelector('#tab-session');
    const registrationTab = document.querySelector('#tab-registration');

    const sessionForm = document.querySelector('#session-form');
    const registrationForm = document.querySelector('#registration-form');

    registrationTab.addEventListener('click', () => {
        registrationTab.classList.add('active');
        registrationForm.classList.add('active');
        sessionTab.classList.remove('active');
        sessionForm.classList.remove('active');
    })

    sessionTab.addEventListener('click', () => {
        sessionTab.classList.add('active');
        sessionForm.classList.add('active');
        registrationTab.classList.remove('active');
        registrationForm.classList.remove('active');
    })
}

const initJoinUsBtn = () => {
    const mainModalOpener = document.querySelector('#main-login-opener')
    const navbarModalOpener = document.querySelector('#navbar-login-opener')

    mainModalOpener.addEventListener('click', () =>{
        navbarModalOpener.click();
    })
}

export { initTabListener, initJoinUsBtn }