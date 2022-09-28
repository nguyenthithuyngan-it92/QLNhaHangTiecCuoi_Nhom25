/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global fetch */

//XÁC NHẬN THANH TOÁN
let confirmPay = (orderId) => {
    const inputOrderId = document.getElementById('inputOrderId');
    var totalPrice = document.getElementById('totalPrice' + orderId).innerText;

    let payWedding = document.getElementById('payWedding');
    let myModal = document.getElementById('myModal');
    let spinnerConfirmWd = document.querySelector('.spinner-confirm-wd');

    if (inputOrderId) {
        inputOrderId.innerText = orderId;
        document.getElementById("inputTotalPrice").innerText = totalPrice;
    }

    // Pay wedding
    payWedding.onclick = () => {
        spinnerConfirmWd.classList.remove('visually-hidden');

        fetch(`/QLNhaHangTiecCuoi/api/confirm-booking/${orderId}`, {
            method: "get",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if (res.status === 200) {
                myModal.style.display = 'none';
                alert("Thanh toán thành công!");
                spinnerConfirmWd.classList.add('visually-hidden');
                location.reload();
            } else
                alert("Đã có lỗi xảy ra!!!");
        }).catch(error => {
            spinnerConfirmWd.classList.add('visually-hidden');
            console.error(error);
        });
    };
};
//////////////////////CHỨC NĂNG XÓA///////////////////////////////////////
//xóa món ăn
function deleteFood(foodId) {
    var name = document.getElementById("name" + foodId).innerText;
    if (confirm("Bạn chắc chắn xóa món ăn " + name + " có mã số " + foodId + " không?") === true) {
        fetch(`/QLNhaHangTiecCuoi/api/admin/food-management/${foodId}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if (res.status === 200) {
                alert("Xóa thành công!");
                location.reload();
            } else
                alert("Đã có lỗi xảy ra!!!");
        });
    }
}

//xóa tiệc cưới
function deleteWedding(weddingId) {
    var name = document.getElementById("name" + weddingId).innerText;
    if (confirm("Bạn chắc chắn xóa tiệc cưới " + name + " có mã số " + weddingId + " không?") === true) {
        fetch(`/QLNhaHangTiecCuoi/api/admin/wedding-management/${weddingId}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if (res.status === 200) {
                alert("Xóa thành công!");
                location.reload();
            } else
                alert("Đã có lỗi xảy ra!!!");
        });
    }
}

//xóa sảnh cưới
function deleteWdHall(weddinghallId) {
    var name = document.getElementById("name" + weddinghallId).innerText;
    if (confirm("Bạn chắc chắn xóa sảnh cưới " + name + " có mã số " + weddinghallId + " không?") === true) {
        fetch(`/QLNhaHangTiecCuoi/api/admin/weddingHall-management/${weddinghallId}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if (res.status === 200) {
                alert("Xóa thành công!");
                location.reload();
            } else
                alert("Đã có lỗi xảy ra!!!");
        });
    }
}

//xóa dịch vụ
function deleteWdService(weddingservicesId) {
    var name = document.getElementById("name" + weddingservicesId).innerText;
    if (confirm("Bạn chắc chắn xóa dịch vụ " + name + " có mã số " + weddingservicesId + " không?") === true) {
        fetch(`/QLNhaHangTiecCuoi/api/admin/weddingService-management/${weddingservicesId}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if (res.status === 200) {
                alert("Xóa thành công!");
                location.reload();
            } else
                alert("Đã có lỗi xảy ra!!!");
        });
    }
}

//////////////////////CHỨC NĂNG SỬA - LẤY THÔNG TIN///////////////////////////////////////
//Lấy UserId để tạo Account
function getUserId(id) {
    document.getElementById("userId").value = id;
}

//Lấy thông tin WeddingHall
function getWdHallInfo(id) {
    var name = document.getElementById("name" + id).innerText;
    document.getElementById("inputName").value = name;

    var price = document.getElementById("price" + id).innerText;
    //format price
    price = price.replace(/\s+/g, '');
    price = price.replace('VNĐ', '');
    price = price.replace(/,/g, '');
    document.getElementById("inputPrice").value = price;

    var description = document.getElementById("description" + id).innerText;
    document.getElementById("inputDescription").value = description;

    var maxTable = document.getElementById("maxTable" + id).innerText;
    document.getElementById("inputMaxTable").value = maxTable;

    var active = document.getElementById("active" + id).innerText;
    if (active === 'true')
        document.getElementById("activeCheck").checked = true;
    else
        document.getElementById("activeCheck").checked = false;

//    var image = document.getElementById("image" + id).innerText;
//    document.getElementById("inputImage").value = image;

    document.getElementById("inputWdHallId").value = id;

    document.getElementById("title").innerText = "Cập nhật sảnh cưới";
    document.getElementById("button").innerText = "Cập nhật";
}

//Lấy thông tin WeddingServices
function getWdServiceInfo(id) {
    var name = document.getElementById("name" + id).innerText;
    document.getElementById("inputName").value = name;

    var price = document.getElementById("price" + id).innerText;
    //format price
    price = price.replace(/\s+/g, '');
    price = price.replace('VNĐ', '');
    price = price.replace(/,/g, '');
    document.getElementById("inputPrice").value = price;

    var description = document.getElementById("description" + id).innerText;
    document.getElementById("inputDescription").value = description;
    
    var active = document.getElementById("active" + id).innerText;
    if (active === 'true')
        document.getElementById("activeCheck").checked = true;
    else
        document.getElementById("activeCheck").checked = false;

    document.getElementById("inputWdServicesId").value = id;

    document.getElementById("title").innerText = "Cập nhật dịch vụ";
    document.getElementById("button").innerText = "Cập nhật";
}

//Lấy thông tin Food
function getFoodInfo(id) {
    var name = document.getElementById("name" + id).innerText;
    document.getElementById("inputName").value = name;

    var price = document.getElementById("price" + id).innerText;
    //format price
    price = price.replace(/\s+/g, '');
    price = price.replace('VNĐ', '');
    price = price.replace(/,/g, '');
    document.getElementById("inputPrice").value = price;

    var description = document.getElementById("description" + id).innerText;
    document.getElementById("inputDescription").value = description;

    var cate = document.getElementById("cate" + id).innerText;
    document.getElementById("inputCate").value = cate;

//    document.getElementById("inputImage").required = false;

//    var image = document.getElementById("image" + id).innerText;
//    document.getElementById("inputImage").value = image;

    document.getElementById("inputFoodId").value = id;

    document.getElementById("title").innerText = "Cập nhật món ăn";
    document.getElementById("button").innerText = "Cập nhật";
}

/////////////Thay đổi Title - Button cho Modal////////////////////
function setButtonFood() {
    document.getElementById("title").innerText = "Thêm món ăn";
    document.getElementById("button").innerText = "Thêm";
}

function setButtonWedding() {
    document.getElementById("title").innerText = "Thêm tiệc cưới";
    document.getElementById("button").innerText = "Thêm";
}

function setButtonHall() {
    document.getElementById("title").innerText = "Thêm sảnh cưới";
    document.getElementById("button").innerText = "Thêm";
}

function setButtonService() {
    document.getElementById("title").innerText = "Thêm dịch vụ";
    document.getElementById("button").innerText = "Thêm";
}
