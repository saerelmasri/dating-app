const login_nav = document.querySelector('#login-nav');
login_nav.addEventListener('click', () => {
    window.location.href = 'login.html';
    login_nav.classList.add("buttonAnimation");
})
const login_header = document.querySelector('#login-header');
login_header.addEventListener('click', () => {
    window.location.href = 'login.html';
    login_header.classList.add("buttonAnimation");
})
