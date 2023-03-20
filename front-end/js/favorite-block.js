const jwtToken = localStorage.getItem('jwt_token');
const baseURL = 'http://127.0.0.1:8000/'
const user_id = localStorage.getItem('user_id');
const fetch = async() => {
    await axios({
        method:'POST',
        url: baseURL + 'api/user/allFavorite',
        data: {
            user_id: user_id
        },
        headers: {
            Authorization: `Bearer ${jwtToken}`
        }
    }).then( async (res) => {
        const favoriteUserIds = res.data.data.map(favorite => favorite.user_favorite_id);
        const request = favoriteUserIds.map(id => axios({
            method: 'POST',
            url: baseURL + 'api/filter/userById',
            data: {
                user_id: id
            },
            headers: {
                Authorization: `Bearer ${jwtToken}`
            }
        }));
        const responses = await Promise.all(request);
        const userData = responses.map(res => res.data.data);
        userData.forEach(user => {
            console.log(user);
            const markup = `<div class="row-user">
                        <h1>${user.first_name} ${user.last_name}</h1>
                        <button type="button" id="remove-action" data-id="${user.id}">X</button>
                    </div>`;
            const element = document.createRange().createContextualFragment(markup);
            document.querySelector(".main-panel").appendChild(element);
            
        });
        const remove_favorite = document.querySelectorAll('#remove-action');
        remove_favorite.forEach((btn) => {
            btn.addEventListener('click', () => {
                const id = btn.getAttribute("data-id");
                axios({
                    method:'POST',
                    url: baseURL + 'api/user/removeFavorite',
                    data: {
                        user_id: user_id,
                        user_favorite_id: id
                    },
                    headers: {
                        Authorization: `Bearer ${jwtToken}`
                    }
                }).then((res) => {
                    btn.closest(".row-user").remove();
                }).catch((err) => {
                    console.log(err);
                })
            });
        });
    }).catch((err) => {
        console.error("Error response:");
        console.error(err.response.data.message);  
        console.error(err.response.status);  
    })
}
fetch()

const home = document.querySelectorAll('.icon4, #home');
home.forEach(element => {
  element.onclick = () => {
    window.location.href = 'dashboard.html';
  };
});
const favorite = document.querySelectorAll('.icon2, #favorite');
favorite.forEach(element => {
  element.onclick = () => {
    window.location.href = 'favorite.html';
  };
});
