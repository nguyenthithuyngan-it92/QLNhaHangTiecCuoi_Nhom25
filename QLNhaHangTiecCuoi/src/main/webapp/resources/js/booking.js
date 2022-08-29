/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global fetch */

window.onload = () => {
    const listCateId = document.querySelectorAll('.wrapper-foods');
    if(listCateId) {
        listCateId.forEach((cateElement, index) => {
            fetch("/QLNhaHangTiecCuoi/api/get-food-by-cateId", {
                method: "post",
                body: JSON.stringify({
                    "cateId": cateElement.attributes.idcate.value
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => {
                return res.json();
            }).then(data => {
                if (data) {
                    const spinner = cateElement.firstElementChild;
                    spinner.classList.add('visually-hidden');
                    data.forEach((food) => {
                       cateElement.innerHTML += `
                            <div class="form-check" style="margin-top: 10px;">
                                <input class="form-check-input" type="checkbox" value="${food.foodId}" id="${food.name}-${food.foodId}">
                                <label class="form-check-label" for="${food.name}-${food.foodId}">
                                  ${food.name}
                                </label>
                            </div>
                        `;
                    });
                    
                    const maxCheck = cateElement.attributes.maxcheckfood.value;
                    const inputCheckList = document.querySelectorAll(`.wrapper-foods-${cateElement.attributes.idcate.value} .form-check-input`)
                    let countCheckCurrent = 0;
                    inputCheckList.forEach((input) => {
                        input.onchange = (e) => {
                            if (e.target.checked) {
                                countCheckCurrent += 1;
                            }
                            
                            if (countCheckCurrent === Number(maxCheck)) {
                                inputCheckList.forEach((inputInner) => {
                                    if (inputInner.value !== input.value && !inputInner.checked) {
                                       inputInner.disabled = !inputInner.disabled; 
                                    }
                                });
                            }
                            
                            if (!e.target.checked) {
                                countCheckCurrent -= 1;
                            }
                        };
                    });
                    
                } else
                    alert("Đã có lỗi xảy ra!!!");
            }).catch((err) => {
                console.error(err);
            });
        });
    }
    
    //kiểm tra chọn ngày đặt tiệc
    let partyDate= document.getElementById('partyDateId');
    if (partyDate) {
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

        partyDate.setAttribute('min', `${year}-${month}-${date}`);
    }
    
};