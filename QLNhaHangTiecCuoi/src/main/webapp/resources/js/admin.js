/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.cookie = "promo_shown=1; Max-Age=2600000; Secure";
var bar = document.querySelector('.bar');
var subNav = document.querySelectorAll('.side-bar-nav ul li .link-wrapper');

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

