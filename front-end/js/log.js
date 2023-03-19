const email = document.querySelector('#email');
const password = document.querySelector('#password');

document.querySelector('#login-action').onclick = async() => {
    document.querySelector('#login-action').classList.add('click-button')
    const data = {
        email: email.value,
        password: password.value
    };
    if(email.value === '' && password.value === ''){
        alert('All fields are require');
    }else{
        try{
            const response = await axios.post('http://127.0.0.1:8000/api/auth/login',data);
            const token = response.data['access_token'];
            localStorage.setItem('jwt_token', token);
            window.location.href = 'dashboard.html';
        }catch(error){
            console.log(error);
        }
    }

}