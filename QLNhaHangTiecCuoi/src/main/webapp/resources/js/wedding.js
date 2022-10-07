/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global fetch, moment */

function loadFeedback(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let f = document.getElementById("feedbacks");
        let h = '';
        for (let d of data)
            h += `
                <div class="be-comment">
                    <div class="be-comment-content">
                        <div class="d-flex">
                            <div class="be-img-comment">
                                <img src="https://res.cloudinary.com/tr-ng-h-m-tp-hcm/image/upload/v1664364214/ysbfiqgafwpuc16trxmz.jpg" class="rounded-circle be-ava-comment" />
                            </div>
                            <h6 class="be-comment-name">
                                ${d.user.name}
                            </h6>
                            <span class="be-comment-time">
                                 <i class="fa-solid fa-clock"></i>
                                 <i>${moment(d.createdDate).locale("vi").fromNow()}</i>
                            </span>
                        </div>
                        
                        <p class="be-comment-text">
                           " ${d.content} "
                        </p>
                    </div>
                </div>
                
            `;
        f.innerHTML = h;
    });
}


function addFeedback(endpoint, weddinghallId) {
    console.log({"content": document.getElementById("feedbackId").value,
        "weddinghallId": weddinghallId});
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("feedbackId").value,
            "weddinghallId": weddinghallId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.querySelector("#feedbacks");
        let h = `
            <div class="be-comment">
                <div class="be-comment-content">
                    <div class="be-img-comment">
                        <img  src="../images/avt.png" class="rounded-circle be-ava-comment" />
                    </div>
                    <div class="d-flex">
                        <h6 class="be-comment-name">
                            ${data.user.name}
                        </h6>
                        <span class="be-comment-time">
                             <i class="fa-solid fa-clock"></i>
                             ${moment(data.createdDate).locale("vi").fromNow()}
                        </span>
                    </div>
                    <p class="be-comment-text">
                       " ${data.content} "
                    </p>
                </div>
            </div>
                
            `;
        d.insertAdjacentHTML("beforebegin", h);
    });
}
