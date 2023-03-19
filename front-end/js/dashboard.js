const baseURL = 'http://127.0.0.1:8000/';
const urlParams = new URLSearchParams(window.location.search);
const user_id = urlParams.get('id');

axios.get('http://127.0.0.1:8000/api/filter/list', {
    params: {
        exclude_user_id: 5
    }
}).then((res) => {
    console.log(res.data.data);
    const data = res.data.data;
    const users = data.map(user => {
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
}).catch((err) => {
    console.log(err);
})
