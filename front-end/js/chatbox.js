const jwtToken = localStorage.getItem('jwt_token');
const current_id = localStorage.getItem('user_id');
const urlParams = new URLSearchParams(window.location.search);
const user_id = urlParams.get('id');
const conver_id = urlParams.get('conv_id');
const baseURL ='http://127.0.0.1:8000/';
axios({
    method: 'post',
    url: baseURL + `api/chat/conversation/${conver_id}`,
    headers: {
        Authorization: `Bearer ${jwtToken}`
    }
}).then((res) => {
    const data = res.data.data;
    displayMessage(data);
})
const displayMessage = (response) => {
    const message = response.map(msg => {
        return{
            message_content: msg.message_content
        }
    });
    message.forEach(msg => {
        const markup = `<div class="message">
                            ${msg.message_content}
                        </div>`
        const element = document.createRange().createContextualFragment(markup);
        document.querySelector(".users-profiles").appendChild(element);
    }
    );
}
const message = document.querySelector('#message');
document.querySelector('#send-action').onclick = () => {
    axios({
        method: 'post',
        url: baseURL + '/api/chat/message',
        data: {
            user_id: current_id,
            conversation_id: conver_id, 
            message_content: message.value
        },
        headers:{
            Authorization: `Bearer ${jwtToken}`
        }
    }).then((res) => {
        window.location.reload();
    }).catch((err) => {
        console.log(err);
    });
}

document.querySelector('.return').onclick = () => {
    window.location.href = 'profile-description.html';
}
