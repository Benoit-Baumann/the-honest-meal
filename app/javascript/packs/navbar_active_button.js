const initNavbarButtons = () => {
    console.log('hello');
    const buttons = document.querySelectorAll('.connected-btn')

    for (var i = 0; i < buttons.length; i++) {
        var btn = buttons[i];

        btn.addEventListener('click', (event) => {
            btn.classList.add('active');
            console.log(event);
        })
    }
}

export default initNavbarButtons;