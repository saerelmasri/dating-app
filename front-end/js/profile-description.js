



document.querySelector('.favorite').onclick = () => {
    document.querySelector('.favorite').classList.add('click-button');
}
document.querySelector('.message').onclick = () => {
    document.querySelector('.message').classList.add('click-button');
}
document.querySelector('.block').onclick = () => {
    document.querySelector('.block').classList.add('click-button');
}
document.querySelector('.return').onclick = () => {
    document.querySelector('.return').classList.add('click-button');
    window.location.href = 'dashboard.html';
}