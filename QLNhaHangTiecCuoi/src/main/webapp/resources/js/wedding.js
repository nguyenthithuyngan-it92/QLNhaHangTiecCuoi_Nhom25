/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function loadFeedback(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        let f = document.getElementById("feedbacks");
        let h = '';
        for (let d of data)
            h += `
                <li class="list-group-item"><em>${d.content}</em> - được phản hồi bởi <strong>${d.user.name}</strong> - vào <strong>${moment(d.createDate).locale("vi").fromNow()}</strong></li>
            `
        f.innerHTML = h;
    });
}


function addFeedback(endpoint, weddingId) {
    console.log({"content": document.getElementById("feedbackId").value,
            "weddingId": weddingId})
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("feedbackId").value,
            "weddingId": weddingId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function(res) {
        return res.json();
    }).then(function(data) {
        let d = document.querySelector("#feedbacks");
        let h = `
                <li class="list-group-item"><em>${data.content}</em> - được phản hồi bởi <strong>${data.user.name}</strong> - vào <strong>${moment(data.createDate).locale("vi").fromNow()}</strong></li>
            `;
        d.insertAdjacentHTML("beforebegin", h);
    })
}

