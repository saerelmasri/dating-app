const urlParams = new URLSearchParams(window.location.search);
const user_id = urlParams.get('id');
const hobbie_1 = document.querySelector('#hobbie1')
const hobbie_2 = document.querySelector('#hobbie2')
const hobbie_3 = document.querySelector('#hobbie3')
const bio = document.querySelector('#bio')

document.querySelector('#register-action').onclick = async() => {
    document.querySelector('#register-action').classList.add('buttonAnimation');
    const token = localStorage.getItem('jwt_token');
    await axios({
        method:'post',
        url: 'http://127.0.0.1:8000/api/auth/login-extra',
        headers: {
            Authorization: `Bearer ${token}`
        },
        data: {
            user_id: user_id,
            bio: bio.value,
            hobbie1: hobbie_1.value,
            hobbie2: hobbie_2.value,
            hobbie3: hobbie_3.value
        }
    }).then((res) => {
        const response = res.data;
        console.log(response);
        if(response.status === 201){
            alert(response.message);
            window.location.href = `add-profile.html?id=${user_id}`;
        }else{
            alert(response.message);
        }
    }).catch((err) => {
        console.log(err);
    });
}