const urlParams = new URLSearchParams(window.location.search);
const user_id = urlParams.get('id');
const profilePicUpload = document.querySelector('#profilePicUpload')
const upload_additional1 = document.querySelector('#additionalPic1Upload')
const upload_additional2 = document.querySelector('#additionalPic2Upload')
const upload_additional3 = document.querySelector('#additionalPic3Upload')
const save_btn = document.querySelector('#action-save')

const uploadImage = async (user_id, profile_pic, profile_add1, profile_add2, profile_add3) => {
  await axios({
    method: 'post',
    url: 'http://127.0.0.1:8000/api/photos/add',
    data: {
      user_id: user_id,
      profile_pic: profile_pic,
      profile_add1: profile_add1,
      profile_add2: profile_add2,
      profile_add3: profile_add3
    },
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  }).then((res) => {
    const response = res.data;
    console.log(response);
  }).catch((err) => {
    console.log(err);
  })
};

save_btn.addEventListener('click', async() => {
  save_btn.classList.add('click-button')
  try {
    const profilePicUrl = await uploadImage(user_id, profilePicUpload.files[0], null, null, null);
    const additional1Url = await uploadImage(user_id, null, upload_additional1.files[0], null, null);
    const additional2Url = await uploadImage(user_id, null, null, upload_additional2.files[0], null);
    const additional3Url = await uploadImage(user_id, null, null, null, upload_additional3.files[0]);
    if (profilePicUrl) {
      console.log('Profile picture uploaded successfully:', profilePicUrl);
    } else {
      console.error('Failed to upload profile picture');
    }
    if (additional1Url) {
      // Store the additional picture 1 URL in the database or do something else with it
      console.log('Additional picture 1 uploaded successfully:', additional1Url);
    } else {
      console.error('Failed to upload additional picture 1');
    }
    if (additional2Url) {
      // Store the additional picture 2 URL in the database or do something else with it
      console.log('Additional picture 2 uploaded successfully:', additional2Url);
    } else {
      console.error('Failed to upload additional picture 2');
    }
    if (additional3Url) {
      // Store the additional picture 3 URL in the database or do something else with it
      console.log('Additional picture 3 uploaded successfully:', additional3Url);
    } else {
      console.error('Failed to upload additional picture 3');
    }
  } catch (error) {
    console.error('Failed to upload image', error);
  }

  
});

