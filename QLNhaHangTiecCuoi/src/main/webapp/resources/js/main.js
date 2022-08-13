/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global fetch */

//format dd/MM/yyyy to yyyy-MM-dd
//function formatDate(str){
//    let day = str.slice(0, 2);
//    let month = str.slice(3, 5);
//    let year = str.slice(6, 10);
//    str = year + '-' + month + '-' + day;
//    return str;
//}

window.onload = () => {
    const form = document.getElementById("submitFormAccount");
    const uploadBtn = document.getElementById("upload_widget");
    let userId;
    if (form) {
        form.onsubmit = handleSubmitUserAccount;
    }

    function handleSubmitUserAccount(e) {
        e.preventDefault();
        let formData = new FormData(form);

//        console.dir(e.target, formData.get('name'), formData.get('identityCard'));
        
        fetch("/QLNhaHangTiecCuoi/api/add-user", {
            method: 'post', 
            body: JSON.stringify({
                "name": formData.get('name'),
                "identityCard": formData.get('identityCard'),
                "dateOfBirth": formData.get('dateOfBirth'),
                "email": formData.get('email'),
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
               })
            } else {
                throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!"); 
            }
        }).then((response) => {
            if(response.ok) {
                responseCopy = response.clone()
                console.log(response); //first consume it in console.log
                return response.json(); //then consume it again, the error happens
           }
        }).then((data) => {
            console.log('trigger here1', data);
            if (data && data.secure_url) {
                console.log('trigger here2');
                return fetch("/QLNhaHangTiecCuoi/api/add-account", {
                    method: 'post',
//                    enctype: 'multipart/form-data',
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
                document.location.href="/QLNhaHangTiecCuoi/login";
            } else {
                throw Error("Có lỗi xảy ra, vui lòng quay lại sau!!"); 
            }
        }).catch((error) => {
            const errEle = document.getElementById('error-message');
            errEle.textContent = "Có lỗi xảy ra, vui lòng thử lại lần nữa!!";
            console.error(error);
        });

        console.log("trigger submit here", formData.get("name"));
    }
};


