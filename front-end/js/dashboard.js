const jwtToken = localStorage.getItem('jwt_token');
const baseURL ='http://127.0.0.1:8000/'

axios.get(baseURL + 'api/auth/user-profile',{
    headers: {
        Authorization: `Bearer ${jwtToken}`
    }
}).then((res) => {
    exclude_id = res.data['id'];
    localStorage.setItem('user_id', exclude_id);
    const markup = `<h2>${res.data['first_name']} ${res.data['last_name']}</h2>`
    const element = document.createRange().createContextualFragment(markup);
    document.querySelector(".info").appendChild(element);
}).catch((err) => {
    console.log(err);
})

const fetch = async() => {
    const user_id = localStorage.getItem('user_id');
    await axios({
        method:'post',
        url: baseURL + 'api/filter/list',
        data: {
            exclude_user_id: user_id 
        },
        headers: {
            Authorization: `Bearer ${jwtToken}`
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
    axios(baseURL + 'api/filter/users', {
        params: {
            age: age_input.value || null,
            location: location_input.value || null,
            first: name_input.value || null
        },
        headers: {
            Authorization: `Bearer ${jwtToken}`
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

const block = document.querySelectorAll('.icon3, #block');
block.forEach(element => {
  element.onclick = () => {
    window.location.href = 'block.html';
  };
});
const favorite = document.querySelectorAll('.icon2, #favorite');
favorite.forEach(element => {
  element.onclick = () => {
    window.location.href = 'favorite.html';
  };
});
const logout = document.querySelectorAll('.icon5, #logout');
logout.forEach(element => {
  element.onclick = () => {
    window.location.href = 'favorite.html';
  };
});



const displayUser = (response) => {
    const users = response.map(user => {
        return{
            id: user.id,
            first_name: user.first_name,
            last_name: user.last_name,
            age: user.age,
            location: user.location
        }
    });
    users.forEach(user => {
        const markup = `<div class="user">
            <div class="user-img"></div>
                <div class="action">
                    <div class="user-info">
                        <h2>${user.first_name} ${user.last_name}, ${user.age}</h2>
                        <h2 class="user-location">${user.location}</h2>
                    </div>
                    <div class="button-side">
                        <button type="submit" data-id="${user.id}" id="check-action">Check</button>
                    </div>
                </div>
            </div>`
        const element = document.createRange().createContextualFragment(markup);
        const buttons = element.querySelectorAll('#check-action')
        buttons.forEach((button) => {
            const id = button.getAttribute("data-id");

            button.addEventListener('click', () => {
                window.location.href = `profile-description.html?id=${id}`;
            });
        });  
        document.querySelector(".users-profiles").appendChild(element);
    }
    );
}