const jwtToken = localStorage.getItem('jwt_token');
const urlParams = new URLSearchParams(window.location.search);
const user_id = urlParams.get('id');
const baseURL ='http://127.0.0.1:8000/'

axios({
    method:'post',
    url: baseURL + 'api/userById',
    headers: {
        Authorization: `Bearer ${jwtToken}`
    },
    data:{
        user_id: 2
    }
}).then((res) => {
    const user_info = res.data.data;
    console.log(user_info);
    const markup = `<div class="info1">
        <h2>${user_info['first_name']} ${user_info['last_name']},</h2>
        <h2> ${user_info['age']}</h2>
        </div>`
    const element = document.createRange().createContextualFragment(markup);
    document.querySelector(".info1").appendChild(element);
}).catch((err) => {
    console.log(err);
});
axios({
    method:'post',
    url: baseURL + 'api/userBio',
    headers: {
        Authorization: `Bearer ${jwtToken}`
    },
    data: {
        user_id: 2
    }
}).then((res) => {
    const user_bio = res.data.data;
    console.log(user_bio);
    const markupBio = `<h3>About</h3>
        <p>
           ${user_bio['bio']}
        </p>
        <h3>Hobbies</h3>
        <ul>
            <li>${user_bio['hobbie1']}</li>
            <li>${user_bio['hobbie2']}</li>
            <li>${user_bio['hobbie3']}</li>
        </ul>`
    const elementBio = document.createRange().createContextualFragment(markupBio);
    document.querySelector(".info2").appendChild(elementBio);
}).catch((err) => {
    console.log(err);
});


document.querySelector('.favorite').onclick = () => {
    document.querySelector('.favorite').classList.add('click-button');
    axios({
        method:'post',
        url: baseURL + 'api/user/addFavorite',
        data: {
            user_id: 5,
            user_favorite_id: 2
        },
        headers:{
            Authorization: `Bearer ${jwtToken}`
        }
    }).then((res) => {
        alert(res.data['message'])
    }).catch((err) => {
        console.log(err);
    })
}
document.querySelector('.message').onclick = () => {
    document.querySelector('.message').classList.add('click-button');
}
document.querySelector('.block').onclick = () => {
    document.querySelector('.block').classList.add('click-button');
    axios({
        method:'post',
        url: baseURL + 'api/user/addBlocked',
        data: {
            user_id: 5,
            user_blocked_id: 2
        },
        headers:{
            Authorization: `Bearer ${jwtToken}`
        }
    }).then((res) => {
        alert(res.data['message'])
    }).catch((err) => {
        console.log(err);
    })
}
document.querySelector('.return').onclick = () => {
    document.querySelector('.return').classList.add('click-button');
    window.location.href = 'dashboard.html';
}