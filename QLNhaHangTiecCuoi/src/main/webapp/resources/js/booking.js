/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global fetch */

window.onload = () => {
    // Action submit form (priceHall*coeficent + priceService + priceFood*maxTable)*discountPay
    let totalPriceBookingWedding = 0;
    let totalPriceFoods = 0;
    let listPriceOfFoods = [];
    let listFoodsOrder = [];
    let discount = 0;
    
    const submitFormWdUser = document.getElementById("submit-form-wd-user");
    const toastMessage = document.getElementById("liveToast");
    const closeBtn = document.querySelector(".btn-close");
    const toastBody = document.querySelector(".toast-body");
    const userEle = document.getElementById("has-user-info");
    const wdEle = document.querySelector(".info-wedding");
    const toastMessageDate = document.querySelector(".toastMessage-date");
    const name = document.getElementById("name");
    const identityCard = document.getElementById("identityCard");
    const phone = document.getElementById("phone");
    const email = document.getElementById("email");
    const totalPriceBookingWeddingText = document.getElementById("total-price-wedding");
    
    const spinnerAddWedding = document.querySelector('.spinner-wd-user'); 
    
    let priceHall = document.getElementById('weddinghallPrice');
    let priceServices = document.getElementById('weddingservicesPrice');
    let coefficient = document.getElementById('coefficient');
    let paymentmethodsId = document.querySelectorAll('.paymentmethodsId');
    let paymentmethodsEle = document.getElementById('paymentmethodsId');
    let quantityTableId = document.getElementById('quantityTableId');

    if (totalPriceBookingWeddingText) {
        totalPriceBookingWedding +=
                Number(priceHall.value) * Number(coefficient.value) + Number(priceServices.value);
    }


    // Render List foods
    const listCateId = document.querySelectorAll('.wrapper-foods');
    if (listCateId) {
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
                            <div class="form-check" style="margin-top: 5px;">
                                <input class="form-check-input" type="checkbox" data-price="${food.price}" value="${food.foodId}" id="${food.name}-${food.foodId}">
                                <label class="form-check-label" for="${food.name}-${food.foodId}">
                                  ${food.name} <h6 style="font-size:13px; margin-bottom:0px;">[${food.price.toLocaleString('it-IT', {style: 'currency', currency: 'VND'})}]</h6>
                                </label>
                            </div>
                        `;
                    });
//                    (priceHall*coeficent + priceService + priceFood*maxTable)*discountPay
                    const maxCheck = cateElement.attributes.maxcheckfood.value;
                    const inputCheckList = document.querySelectorAll(`.wrapper-foods-${cateElement.attributes.idcate.value} .form-check-input`)
                    let countCheckCurrent = 0;
                    inputCheckList.forEach((input) => {
                        input.onchange = (e) => {
                            if (e.target.checked) {
                                listPriceOfFoods = [...listPriceOfFoods,
                                    {
                                        name: e.target.id,
                                        price: e.target.dataset.price
                                    }
                                ];

                                listFoodsOrder = [...listFoodsOrder,
                                    {
                                        foodId: e.target.value
                                    }
                                ];

                                totalPriceFoods = listPriceOfFoods.reduce((foodPricePrevious, foodPriceCurrent) => {
                                    return parseFloat(foodPricePrevious) + parseFloat(foodPriceCurrent.price);
                                }, 0);

                                // Nếu đã nhập số lượng bàn và đã có discount
                                console.log(quantityTableId.value, discount, totalPriceBookingWedding);
                                if (quantityTableId.value && discount) {
                                    totalPriceBookingWedding += (e.target.dataset.price * Number(quantityTableId.value)) * discount;
                                    totalPriceBookingWeddingText.textContent = totalPriceBookingWedding.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
                                    totalPriceBookingWeddingText.dataset.totalprice = totalPriceBookingWedding;
                                } else if (quantityTableId.value) {
                                    totalPriceBookingWedding += e.target.dataset.price * Number(quantityTableId.value);
                                    totalPriceBookingWeddingText.textContent = totalPriceBookingWedding.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
                                    totalPriceBookingWeddingText.dataset.totalprice = totalPriceBookingWedding;
                                }
//                               console.log('tổng tiền đồ ăn',totalPriceFoods);
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
                                const indexFood = listPriceOfFoods.findIndex((foodPrice) => {
                                    return foodPrice.name === e.target.id;
                                });
                                listFoodsOrder.splice(indexFood, 1);
                                listPriceOfFoods.splice(indexFood, 1);

                                totalPriceFoods = listPriceOfFoods.reduce((foodPricePrevious, foodPriceCurrent) => {
                                    return parseFloat(foodPricePrevious) + parseFloat(foodPriceCurrent.price);
                                }, 0);

                                // Nếu đã nhập số lượng bàn và đã có discount
                                console.log(quantityTableId.value, discount, totalPriceBookingWedding);
                                if (quantityTableId.value && discount) {
                                    totalPriceBookingWedding -= (e.target.dataset.price * Number(quantityTableId.value)) * discount;
                                    totalPriceBookingWeddingText.textContent = totalPriceBookingWedding.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
                                    totalPriceBookingWeddingText.dataset.totalprice = totalPriceBookingWedding;
                                } else if (quantityTableId.value) {
                                    totalPriceBookingWedding -= e.target.dataset.price * Number(quantityTableId.value);
                                    totalPriceBookingWeddingText.textContent = totalPriceBookingWedding.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
                                    totalPriceBookingWeddingText.dataset.totalprice = totalPriceBookingWedding;
                                }
                                console.log('tổng tiền đồ ăn', totalPriceFoods);
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
    let partyDate = document.getElementById('partyDateId');
    if (partyDate) {
        const currentDate = new Date();
        let year = currentDate.getFullYear();
        let month = currentDate.getMonth() + 1;
        let date = currentDate.getDate() + 7;

        if (month < 10) {
            month = `0${month}`;
        }
        if (date < 10) {
            date = `0${date}`;
        }

        partyDate.setAttribute('min', `${year}-${month}-${date}`);
    }

    // Set lại text Total Price
    totalPriceBookingWeddingText.textContent = totalPriceBookingWedding.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
    totalPriceBookingWeddingText.dataset.totalprice = totalPriceBookingWedding;

    if (paymentmethodsId) {
        paymentmethodsId.forEach((payment) => {
            // Thanh toán tiền mặt
            if (payment.value === "1") {
                payment.checked = true;
            }
            ;

            // Cấm chọn Momo
            if (payment.value === "2") {
                payment.disabled = true;
            }
            ;

            payment.onchange = (e) => {
                discount = parseFloat(e.target.dataset.discount);
                let totalPriceBookingWeddingTemp = totalPriceBookingWedding;
                totalPriceBookingWeddingTemp = totalPriceBookingWeddingTemp - (totalPriceBookingWeddingTemp * parseFloat(e.target.dataset.discount));
                totalPriceBookingWeddingText.textContent = totalPriceBookingWeddingTemp.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
                totalPriceBookingWeddingText.dataset.totalprice = totalPriceBookingWeddingTemp;
                console.log(e.target.dataset.discount);
            };
        });
    }

    if (quantityTableId) {
        quantityTableId.oninput = (event) => {
            if (event.target.valueAsNumber >= +event.target.max) {
                event.target.valueAsNumber = +event.target.max;
            }

            if (totalPriceFoods) {
                let totalPriceBookingWeddingTemp = totalPriceBookingWedding;
                totalPriceBookingWeddingTemp += totalPriceFoods * Number(quantityTableId.value);
                totalPriceBookingWeddingText.textContent = totalPriceBookingWeddingTemp.toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
                totalPriceBookingWeddingText.dataset.totalprice = totalPriceBookingWeddingTemp;
            }
        };
    }

    // Submit form booking wedding
    submitFormWdUser.onclick = (e) => {
        // Disabled button submit
        e.target.disabled = true;
        spinnerAddWedding.classList.remove('visually-hidden');

        // Submit data
        if (!userEle) {
            fetch("/QLNhaHangTiecCuoi/api/add-user", {
                method: "post",
                body: JSON.stringify({
                    "email": email.value || '',
                    "name": name.value,
                    "phone": phone.value,
                    "identityCard": identityCard.value,
                    "sex": '',
                    "dateOfBirth": ''
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => {
                return res.json();
            }).then((data) => {
                fetch("/QLNhaHangTiecCuoi/api/order-wedding", {
                    method: "post",
                    body: JSON.stringify({
                        "userId": data.userId,
                        "paymentId": paymentmethodsEle.value,
                        "weddingId": wdEle.dataset.weddingid,
                        "totalPrice": totalPriceBookingWeddingText.dataset.totalprice,
                        "quantityTable": quantityTableId.value,
                        "partyDate": partyDate.value
                    }),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).then(res => {
                    return res.json();
                }).then(data => {
                    if (data && listFoodsOrder.length > 0) {
                        return fetch(`/QLNhaHangTiecCuoi/api/order-food/${data.orderId}`, {
                            method: "post",
                            body: JSON.stringify({
                                "foods": listFoodsOrder
                            }),
                            headers: {
                                "Content-Type": "application/json"
                            }
                        });
                    } else {
                        console.warn('Something went wrong!!!');
                    }
                }).then(res => {
                    return res.json();
                }).then(data => {
                    // Active button submit
                    e.target.disabled = false;
                    spinnerAddWedding.classList.add('visually-hidden');

                    setTimeout(() => {
                        document.location.href = "/QLNhaHangTiecCuoi";
                    }, 7000);

                    // Show Toast Message
                    toastMessage.classList.add('showing');

                    if (data) {
                        toastMessageDate.innerHTML = new Date(data.createdDate).toLocaleDateString();
                        toastBody.innerText = `Quý khách ${name.value} đã đặt tiệc thành công với mã đặt hàng là ${data.orderId}. 
                                                Quý khách vui lòng đến nhà hàng trước ngày ${new Date(data.partyDate).toLocaleDateString()} để thanh toán hóa đơn với tổng số tiền là ${data.totalPrice.toLocaleString('it-IT', {style: 'currency', currency: 'VND'})}. 
                                                Trân trọng cảm ơn quý khách!!`;
                    }
                    console.log(data);
                }).catch((error) => {
                    // Active button submit
                    e.target.disabled = false;
                    spinnerAddWedding.classList.add('visually-hidden');

                    console.error(error);
                });
            });
        } else {
            fetch("/QLNhaHangTiecCuoi/api/order-wedding", {
                method: "post",
                body: JSON.stringify({
                    "userId": userEle.dataset.userid,
                    "paymentId": paymentmethodsEle.value,
                    "weddingId": wdEle.dataset.weddingid,
                    "totalPrice": totalPriceBookingWeddingText.dataset.totalprice,
                    "quantityTable": quantityTableId.value,
                    "partyDate": partyDate.value
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => {
                return res.json();
            }).then(data => {
                if (data && listFoodsOrder.length > 0) {
                    return fetch(`/QLNhaHangTiecCuoi/api/order-food/${data.orderId}`, {
                        method: "post",
                        body: JSON.stringify({
                            "foods": listFoodsOrder
                        }),
                        headers: {
                            "Content-Type": "application/json"
                        }
                    });
                } else {
                    console.warn('Something went wrong!!!');
                }
            }).then(res => {
                return res.json();
            }).then(data => {
                // Active button submit
                e.target.disabled = false;
                spinnerAddWedding.classList.add('visually-hidden');

                setTimeout(() => {
                    document.location.href = "/QLNhaHangTiecCuoi";
                }, 7000);

                // Show Toast Message
                toastMessage.classList.add('showing');

                if (data) {
                    toastMessageDate.innerHTML = new Date(data.createdDate).toLocaleDateString();
                    toastBody.innerText = `Quý khách ${name.value} đã đặt tiệc thành công với mã đặt hàng là ${data.orderId}. 
                                            Quý khách vui lòng đến nhà hàng trước ngày ${new Date(data.partyDate).toLocaleDateString()} để thanh toán hóa đơn với tổng số tiền là ${data.totalPrice.toLocaleString('it-IT', {style: 'currency', currency: 'VND'})}. 
                                            Trân trọng cảm ơn quý khách!!`;
                }
                console.log(data);
            }).catch((error) => {
                // Active button submit
                e.target.disabled = false;
                spinnerAddWedding.classList.add('visually-hidden');

                console.error(error);
            });
        }

    };

    // Close Toast Message
    closeBtn.onclick = () => {
        toastMessage.classList.remove('showing');
    };
};