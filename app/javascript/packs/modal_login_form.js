
const initTabListener = () => {
    const sessionTab = document.querySelector('#tab-session')
    const registrationTab = document.querySelector('#tab-registration')

    const sessionForm = document.querySelector('#session-form');
    const registrationForm = document.querySelector('#registration-form');

    registrationTab.addEventListener('click', (event) => {
        console.log(event);
        registrationTab.classList.add('active');
        registrationForm.classList.add('active');
        sessionTab.classList.remove('active');
        sessionForm.classList.remove('active');
    })

    sessionTab.addEventListener('click', (event) => {
        console.log(event);
        sessionTab.classList.add('active');
        sessionForm.classList.add('active');
        registrationTab.classList.remove('active');
        registrationForm.classList.remove('active');
    })
}

export default initTabListener