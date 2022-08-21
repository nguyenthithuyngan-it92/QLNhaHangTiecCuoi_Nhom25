/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global fetch */

function deleteFood(id){
    if (confirm("Bạn chắc chắn xóa món ăn có mã số " + id + " không?") === true) { 
        fetch(`QLNhaHangTiecCuoi/api/admin/food-management/${id}`, {
            method: "delete",
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => {
            if (res.status === 204) {
                alert("Xóa thành công!");
                location.reload();
            } else 
                alert("Đã có lỗi xảy ra!!!");
        });
    }
}


