const initNavbarButtons = () => {
    console.log('hello');
    const buttons = document.querySelectorAll('.connected-btn')

    buttons.forEach((btn) => {
      console.log(btn)
      btn.addEventListener("click", (event) => {
        event.currentTarget.classList.add("active");
      });
    });
  }

export default initNavbarButtons;
