const urlParams = new URLSearchParams(window.location.search);
const user_id = urlParams.get('id');
const hobbie_1 = document.querySelector('#hobbie1')
const hobbie_2 = document.querySelector('#hobbie2')
const hobbie_3 = document.querySelector('#hobbie3')
const bio = document.querySelector('#bio')
const relation_type = document.querySelector('.relation-type')
let selectedValue;
const baseURL = 'http://127.0.0.1:8000/';

document.querySelector('#register-action').onclick = async() => {
    document.querySelector('#register-action').classList.add('click-button');
    selectedValue = relation_type.value; 
    if(hobbie_1.value === '' && hobbie_2.value === '' && hobbie_3.value === '' && bio.value === '' && relation_type.value === ''){
        alert('Please provide the required fields');
    }else{
        await axios.all([
            axios({
                method:'post',
                url: baseURL + 'api/auth/login-extra',
                data: {
                    user_id: user_id,
                    bio: bio.value,
                    hobbie1: hobbie_1.value,
                    hobbie2: hobbie_2.value,
                    hobbie3: hobbie_3.value
                }
            }),
            axios({
                method:'post',
                url: baseURL + 'api/auth/login-relation',
                data: {
                    user_id: user_id,
                    relation_type_id: selectedValue
                }
            })
        ]).then(axios.spread((infoResponse, relationResponse) => {
            const response = infoResponse.data;
            console.log(response);
            if(response.status === 201){
                alert(response.message);
                window.location.href = `add-profile.html?id=${user_id}`;
            }else{
                alert(response.message);
            }
        })).catch((err) => {
            console.log(err);
        })
    }
}