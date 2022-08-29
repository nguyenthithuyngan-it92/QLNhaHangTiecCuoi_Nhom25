/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global fetch */

window.onload = () => {
    const form = document.getElementById("submitFormAccount");
    const uploadBtn = document.getElementById("upload_widget");
    let userId;

    let dateOfBirth = document.getElementById('dateOfBirth');
    let phoneInput = document.getElementById('phone');
    let cmndInput = document.getElementById('identityCard');
    let passwordInput = document.getElementById('password');
    let confirmPasswordInput = document.getElementById('confirmPassword');

    let textValidatePass = document.getElementById('invalid-feedback-password');
    let textValidateCFPass = document.getElementById('invalid-feedback-cfpassword');
    let textValidatePhone = document.getElementById('invalid-feedback-phone');
    let textValidateCMND = document.getElementById('invalid-feedback-cmnd');
    
    if (dateOfBirth) {
        const currentDate = new Date();
        let year = currentDate.getFullYear() - 18;
        let month = currentDate.getMonth() + 1;
        let date = currentDate.getDate();

        if (month < 10) {
            month = `0${month}`;
        }
        if (date < 10) {
            date = `0${date}`;
        }

        dateOfBirth.setAttribute('max', `${year}-${month}-${date}`);
    }

    const handleValidateForm = (event, inputType) => {
        switch (inputType) {
            case 'phone':
                if (!isValidPhone(event.target.value)) {
                    event.target.classList.add('is-invalid');
                    textValidatePhone.textContent = 'Số điện thoại bạn nhập không hợp lệ!';
                } else {
                    event.target.classList.remove('is-invalid');
                }
                break;
            case 'cmnd':
                if (!isValidCMND(event.target.value)) {
                    event.target.classList.add('is-invalid');
                    textValidateCMND.textContent = 'Số CMND/CCCD bạn nhập không hợp lệ!';
                } else {
                    event.target.classList.remove('is-invalid');
                }
                break;
            case 'password':
            case 'confirmPassword':
                if (event.target.value.length < 4) {
                    event.target.classList.add('is-invalid');
                    textValidatePass.textContent =
                            textValidateCFPass.textContent =
                            'Mật khẩu phải trên 4 ký tự!!!';
                } else if (event.target.value !== passwordInput.value &&
                        inputType === 'confirmPassword') {
                    event.target.classList.add('is-invalid');
                    textValidateCFPass.textContent = 'Mật khẩu không trùng khớp!';
                } else {
                    event.target.classList.remove('is-invalid');
                }
                break;
        }
    };

    phoneInput.addEventListener('change', (event) => handleValidateForm(event, 'phone'));

    cmndInput.addEventListener('change', (event) => handleValidateForm(event, 'cmnd'));

    passwordInput.addEventListener('change', (event) => handleValidateForm(event, 'password'));

    confirmPasswordInput.addEventListener('change', (event) => handleValidateForm(event, 'confirmPassword'));



    if (form) {
        form.onsubmit = handleSubmitUserAccount;
    }

    function handleSubmitUserAccount(e) {
        e.preventDefault();
        console.log(form.checkValidity());
        form.classList.add('was-validated');
        let formData = new FormData(form);

        if (form.checkValidity()) {
            fetch("/QLNhaHangTiecCuoi/api/add-user", {
                method: 'post',
                body: JSON.stringify({
                    "name": formData.get('name'),
                    "identityCard": formData.get('identityCard'),
                    "dateOfBirth": formData.get('dateOfBirth'),
                    "email": formData.get('email') || "",
                    "phone": formData.get('phone'),
                    "sex": formData.get('sex')
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then((res) => {
                return res.json();
            }).then(data => {
                if (data && data.userId > 0) {
                    userId = data.userId;
                    const formData = new FormData();
                    const file = document.getElementById('upload_avatar').files[0];
                    formData.append("file", file);
                    formData.append("upload_preset", "upload image");

                    return fetch('https://api.cloudinary.com/v1_1/tr-ng-h-m-tp-hcm/image/upload', {
                        method: "POST",
                        body: formData
                    });
                } else {
                    throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!");
                }
            }).then((response) => {
                if (response.ok) {
                    responseCopy = response.clone();
                    console.log(response); //first consume it in console.log
                    return response.json(); //then consume it again, the error happens
                }
            }).then((data) => {
                console.log('trigger here1', data);
                if (data && data.secure_url) {
                    console.log('trigger here2');
                    return fetch("/QLNhaHangTiecCuoi/api/add-account", {
                        method: 'post',
                        body: JSON.stringify({
                            "username": formData.get('username'),
                            "password": formData.get('password'),
                            "confirmPassword": formData.get('confirmPassword'),
                            "avt": data.secure_url,
                            "userId": userId
                        }),
                        headers: {
                            "Content-Type": "application/json"
                        }
                    });
                } else {
                    throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!");
                }
            }).then((res) => {
                return res.json();
            }).then(data => {
                if (data && data.userId > 0) {
                    document.location.href = "/QLNhaHangTiecCuoi/login";
                } else {
                    throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!");
                }
            }).catch((error) => {
                const errEle = document.getElementById('error-message');
                errEle.textContent = "Có lỗi xảy ra, vui lòng thử lại lần nữa!!";
                console.error(error);
            });
        }
    }
};

const isValidPhone = phone =>
    /(([03+[2-9]|05+[6|8|9]|07+[0|6|7|8|9]|08+[1-9]|09+[1-4|6-9]]){3})+[0-9]{7}\b/g.test(phone);

const isValidCMND = id => /^\d{9}$/.test(id) || /^\d{12}$/.test(id);
