/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.cookie = "promo_shown=1; Max-Age=2600000; Secure";
var bar = document.querySelector('.bar');
var subNav = document.querySelectorAll('.side-bar-nav ul li .link-wrapper');

//kiểm tra chọn ngày sinh
let dateOfBirth = document.getElementById('dateOfBirthId');
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

//kiểm tra chọn ngày tạo hóa đơn
let createdDate = document.getElementById('createdDate');
if (createdDate) {
    const currentDate = new Date();
    let year = currentDate.getFullYear();
    let month = currentDate.getMonth() + 1;
    let date = currentDate.getDate();

    if (month < 10) {
        month = `0${month}`;
    }
    if (date < 10) {
        date = `0${date}`;
    }

    createdDate.setAttribute('max', `${year}-${month}-${date}`);
}

if (bar) {
    bar.onclick = function () {
        document.querySelector('.side-bar').classList.toggle('hide');
        document.querySelector('header').classList.toggle('slide-left');
        document.querySelector('.main-content').classList.toggle('slide-left');
        console.log('hello bar');
    };
}
console.log(bar);
subNav.forEach(sub => {
    sub.onclick = function (e) {
        sub.classList.toggle('active');
//        e.preventDefault();
        console.log(sub);
    };
});

