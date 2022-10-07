/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global moment, fetch */

let profileImageEle = document.getElementById('profile-user-id');
if (profileImageEle && profileImageEle.dataset.iduser) {
//    setInterval(() => {
//        
//    }, 10000);
    fetch('/QLNhaHangTiecCuoi/api/get-notifications', {
        method: 'POST',
        body: JSON.stringify({
            "userId": profileImageEle.dataset.iduser
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then((res) => {
        return res.json();
    }).then((data) => {
//        console.log('data', data);
        let notifications = document.getElementById('notifications');
        if (data) {
            data.forEach((noti) => {
                notifications.innerHTML += `
                    <div class="noti">
                        <a href="#">
                            <h6 class="title-noti">Bạn đã đặt tiệc thành công</h6>
                            <div class="content-noti">Mã hóa đơn ${noti.orderId}. Để xem chi tiết vui lòng kiểm tra mail của bạn.</div>
                            <div class="time-noti">
                                <i class="fa-solid fa-clock"></i>
                                <i>${moment(noti.createdDate).locale("vi").fromNow()}</i>
                            </div>
                            <hr class="dropdown-divider"></hr>
                        </a>
                    </div>
                    
                `;
            });
        }
    }).catch((error) => {
        console.error('err => ', error);
    });
}


