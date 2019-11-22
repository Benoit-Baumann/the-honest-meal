const initLoadingAnimation = () => {

    const homeTitleDiv = document.querySelector('.home-title')

    // Listent to click on create account button
    const create = document.querySelector("#btn-create")
    create.addEventListener('click', (event) => {
        // console.log(create);
        // homeTitleDiv.insertAdjacentHTML('afterend', "<%= render partial: 'shared/roller_loader' %>"); // A modifier

    });
    
    // Listen to click on connet button
    const connect = document.querySelector("#btn-connect")
    connect.addEventListener('click', (event) => {
        // console.log(connect);
        // homeTitleDiv.insertAdjacentHTML('afterend', "<%= render partial: 'shared/roller_loader' %>"); // A modifier
    });
}

export default initLoadingAnimation;