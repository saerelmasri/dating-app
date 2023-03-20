const jwtToken = localStorage.getItem('jwt_token');
const current_id = localStorage.getItem('user_id');
const urlParams = new URLSearchParams(window.location.search);
const user_id = urlParams.get('id');
const baseURL ='http://127.0.0.1:8000/'

axios({
    method:'post',
    url: baseURL + 'api/filter/userById',
    headers: {
        Authorization: `Bearer ${jwtToken}`
    },
    data:{
        user_id: user_id
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
    url: baseURL + 'api/filter/userBio',
    headers: {
        Authorization: `Bearer ${jwtToken}`
    },
    data: {
        user_id: user_id
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
            user_id: current_id,
            user_favorite_id: user_id
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
    //Check if there is a conversation between current user and user from profile
    axios({
        method:'POST',
        url: baseURL + 'api/chat/getConversation',
        data: {
            user1_id: current_id,
            user2_id: user_id
        },
        headers: {
            Authorization: `Bearer ${jwtToken}`
        }
    }).then((res) => {
        //If no conversation create a conversation
        const response = res.data.data;
        const conversationId = response['conversation_id'];
        if(response['status'] === 404){
            axios({
                method: 'post',
                url: baseURL + 'api/chat/createConversation',
                data:{
                    user1_id: current_id,
                    user2_id: user_id
                },
                headers:{
                    Authorization: `Bearer ${jwtToken}`
                }
            }).then((res) => {
                const conver_id = res.data.data;
                window.location.href = `chatbox.html?conv_id=${conver_id}`;
            }).catch((err) => {
                console.log(err);
            })
        }else{
            window.location.href = `chtbox.html?conv_id=${conversationId}`;
        }
    }).catch((err) => {
        console.log(err);
    })
}
document.querySelector('.block').onclick = () => {
    document.querySelector('.block').classList.add('click-button');
    axios({
        method:'post',
        url: baseURL + 'api/user/addBlocked',
        data: {
            user_id: current_id,
            user_blocked_id: user_id
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