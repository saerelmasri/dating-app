const baseURL = 'http://127.0.0.1:8000/';
const urlParams = new URLSearchParams(window.location.search);
const user_id = urlParams.get('id');

const fetch = () => {
    axios.get(baseURL + 'api/filter/list', {
        params: {
            exclude_user_id: 5
        }
    }).then((res) => {
        const data = res.data.data;
        displayUser(data);
    }).catch((err) => {
        console.log(err);
    })
}
fetch()

const name_input = document.querySelector('#username')
const location_input = document.querySelector('#location')
const age_input = document.querySelector('#age')
document.querySelector('#action-filter').onclick = () => {
    document.querySelector(".users-profiles").innerHTML ='';
    document.querySelector('#action-filter').classList.add('click-button');
    axios('http://127.0.0.1:8000/api/filter/users', {
        params: {
            age: age_input.value || null,
            location: location_input.value || null,
            first: name_input.value || null
        }
    }).then((res) => {
        const data = res.data.data;
        displayUser(data)
    }).catch((err) => {
        console.error("Error response:");
        console.error(err.response.data.message);  
        console.error(err.response.status);  
        const markup = `<h2>${err.response.data.message} ${err.response.status}</h2>`
        const element = document.createRange().createContextualFragment(markup);
        document.querySelector(".users-profiles").appendChild(element);
    })
}
document.querySelector('#action-clear').onclick = () => {
    document.querySelector('#action-clear').classList.add('click-button');
    document.querySelector(".users-profiles").innerHTML ='';
    if(name_input.value != '' || location_input.value || name_input.value != ""){
        name_input.value = '';
        location_input.value = '';
        age.value = '';
    }
    fetch()
}



const displayUser = (response) => {
    const users = response.map(user => {
        return{
            first_name: user.first_name,
            last_name: user.last_name,
            age: user.age,
            location: user.location
        }
    });
    users.forEach(user => {
        const markup = `<div class="user">
                <div class="user-img"></div>
                <div class="user-info">
                    <h2>${user.first_name} ${user.last_name}, ${user.age}</h2>
                    <h2 class="user-location">${user.location}</h2>
                </div>
            </div>`
        const element = document.createRange().createContextualFragment(markup);
        document.querySelector(".users-profiles").appendChild(element);
    });
}