const email = document.querySelector('#email');
const password = document.querySelector('#password');

document.querySelector('#login-action').onclick = async() => {
    const data = {
        email: email.value,
        password: password.value
    };

    try{
        const response = await axios.post('http://127.0.0.1:8000/api/auth/login',data);
        console.log(response);
    }catch(error){
        console.log(error);
    }
    document.querySelector('#login-action').classList.add('buttonAnimation')

}