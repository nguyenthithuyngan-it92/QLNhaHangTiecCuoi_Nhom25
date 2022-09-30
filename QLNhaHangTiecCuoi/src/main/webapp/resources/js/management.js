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
                alert("Xóa món ăn thành công!");
                location.reload();
            } else
                alert("Đã có lỗi xảy ra!!!");
        });
    }
}

//xóa tiệc cưới
function deleteEmployee(userId) {
    var name = document.getElementById("name" + userId).innerText;
    if (confirm("Bạn chắc chắn xóa nhân viên " + name + " có mã số " + userId + " không?") === true) {
        fetch(`/QLNhaHangTiecCuoi/api/admin/employee-management/${userId}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if (res.status === 200) {
                alert("Xóa nhân viên thành công!");
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
                alert("Xóa sảnh cưới thành công!");
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
                alert("Xóa gói dịch vụ thành công!");
                location.reload();
            } else
                alert("Đã có lỗi xảy ra!!!");
        });
    }
}
//format dd/MM/yyyy to yyyy-MM-dd
function formatDate(str){
    let day = str.slice(0, 2);
    let month = str.slice(3, 5);
    let year = str.slice(6, 10);
    str = year + '-' + month + '-' + day;
    return str;
}

//////////////////////CHỨC NĂNG SỬA - LẤY THÔNG TIN///////////////////////////////////////
//Lấy UserId để tạo Account
function getUserId(id) {
    document.getElementById("userId").value = id;
}

//Lấy thông tin NHÂN VIÊN(USER)
function getEmployeeUserInfo(id) {
    var name = document.getElementById("name" + id).innerText;
    document.getElementById("inputName").value = name;

    var birthDay = document.getElementById("birthDay" + id).innerText;
    //format date
    document.getElementById("inputBirthDay").value = formatDate(birthDay);

    var sex = document.getElementById("sex" + id).innerText;
    document.getElementById("inputSex").value = sex;
    
    var identityCard = document.getElementById("identityCard" + id).innerText;
    document.getElementById("inputIdentityCard").value = identityCard;
    
    var phone = document.getElementById("phone" + id).innerText;
    document.getElementById("inputPhone").value = phone;
    
    var mail = document.getElementById("mail" + id).innerText;
    document.getElementById("inputmail").value = mail;
    
    var position = document.getElementById("position" + id).innerText;
    document.getElementById("inputPosition").value = position;

    var role = document.getElementById("role" + id).innerText;
    document.getElementById("inputRole").value = role;

    document.getElementById("inputUserId").value = id;

    document.getElementById("title").innerText = "Chỉnh sửa thông tin nhân viên";
    document.getElementById("button").innerText = "Cập nhật";
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

function setButtonEmployee() {
    document.getElementById("title").innerText = "Thêm thông tin nhân viên";
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
