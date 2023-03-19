const email = document.querySelector('#email');
const first_name = document.querySelector('#first_name');
const last_name = document.querySelector('#last_name');
const age = document.querySelector('#age');
const location_user = document.querySelector('#location');
const password = document.querySelector('#password');
const confirm_password = document.querySelector('#confirm_password');
const maleRadio = document.getElementById("male");
const femaleRadio = document.getElementById("female");

document.querySelector('#register-action').onclick = async () => {
  document.querySelector('#register-action').classList.add('click-button');
  let genderId = null;
  if (maleRadio.checked) {
    genderId = 1;
  } else if (femaleRadio.checked) {
    genderId = 2;
  } else {
    alert("Please select your gender.");
  }
  if(password.value !== confirm_password.value){
      alert("Password do not match");
  }else{
    await axios({
      method: 'post',
      url: 'http://127.0.0.1:8000/api/auth/signup',
      data: {
        email: email.value,
        first_name:first_name.value,
        last_name:last_name.value,
        age: age.value,
        location: location_user.value,
        password: password.value,
        gender_id: genderId
      }
    }).then((res) => {
      const response = res.data;
      const user_id = response.user_id;
      if(response.status === 201){
        alert(response.message);
        window.location.href = `register-extra-info.html?id=${user_id}`;
      }else{
        alert(response.message);
      }
    }).catch((err) => console.log(err));
  }
}