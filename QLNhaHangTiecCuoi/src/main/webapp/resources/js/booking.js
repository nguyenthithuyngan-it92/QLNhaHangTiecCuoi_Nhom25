/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global fetch, parseFloat */

const isValidPhone = phone =>
    /(([03+[2-9]|05+[6|8|9]|07+[0|6|7|8|9]|08+[1-9]|09+[1-4|6-9]]){3})+[0-9]{7}\b/g.test(phone);

const isValidCMND = id => /^\d{9}$/.test(id) || /^\d{12}$/.test(id);

const isValidMail = email => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email);

window.onload = () => {
    //get info user
    const name = document.getElementById("name");
    const identityCard = document.getElementById("identityCard");
    const phone = document.getElementById("phone");
    const email = document.getElementById("email");
    
    //check validator User
    let phoneInput = document.getElementById('phone');
    let emailInput = document.getElementById('email');
    let cmndInput = document.getElementById('identityCard');
    
    let textValidatePhone = document.getElementById('invalid-feedback-phone');
    let textValidateCMND = document.getElementById('invalid-feedback-cmnd');
    let textValidateEmail = document.getElementById('invalid-feedback-mail');
    
    let totalPriceBookingWedding = 0;
    let totalPriceFoods = 0;
    let listPriceOfFoods = [];
    let listFoodsOrder = [];
    let discount = 0;
    
    const submitFormWdUser = document.getElementById("submit-form-wd-user");
    
    const toastMessage = document.getElementById("liveToast");
    const closeBtn = document.querySelector(".btn-close");
    const toastBody = document.querySelector(".toast-body");
    const toastMessageDate = document.querySelector(".toastMessage-date");
    
    const userEle = document.getElementById("has-user-info");
    const wdEle = document.querySelector(".info-wedding");

    const totalPriceBookingWeddingText = document.getElementById("total-price-wedding");
    
    const spinnerAddWedding = document.querySelector('.spinner-wd-user'); 
    const btnCloseForm = document.getElementById('btnClose');
    
    let priceHall = document.getElementById('weddinghallPrice');
    let paymentmethodsId = document.querySelectorAll('.paymentmethodsId');
    let paymentmethodsEle = document.getElementById('paymentmethodsId');
    let quantityTableId = document.getElementById('quantityTableId');

    let orderSelected = [
        {
            type: 'hall',
            price: priceHall.value
        }
    ];
    
    const handleValidateForm = (event, inputType) => {
        switch (inputType) {
            case 'phone':
                if (!isValidPhone(event.target.value)) {
                    event.target.classList.add('is-invalid');
                    textValidatePhone.textContent = 'Số điện thoại bạn nhập không hợp lệ!';
                } else {
                    event.target.classList.remove('is-invalid');
                }
                break;
            case 'cmnd':
                if (!isValidCMND(event.target.value)) {
                    event.target.classList.add('is-invalid');
                    textValidateCMND.textContent = 'Số CMND/CCCD bạn nhập không hợp lệ!';
                } else {
                    event.target.classList.remove('is-invalid');
                }
                break;
            case 'email':
                if (!isValidMail(event.target.value)) {
                    event.target.classList.add('is-invalid');
                    textValidateEmail.textContent = 'Địa chỉ mail bạn nhập không đúng định dạng!';
                } else {
                    event.target.classList.remove('is-invalid');
                }
                break;
        }
    };

    phoneInput.addEventListener('change', (event) => handleValidateForm(event, 'phone'));
    
    emailInput.addEventListener('change', (event) => handleValidateForm(event, 'email'));

    cmndInput.addEventListener('change', (event) => handleValidateForm(event, 'cmnd'));
    
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
    
    //get service and shift
    let previewPriceServiceInput = document.getElementById('weddingservicesPricePreview');
    let weddingServiceOptions = document.getElementById('weddingservicesId');
    let shiftId = document.getElementById('shiftId');
    let shiftPreviewInput = document.getElementById('shiftPreviewData');
    
    // Listen Event Services - Shift  
    weddingServiceOptions.addEventListener('change', (event) => handleChangeBooking(event.target, previewPriceServiceInput, 'services'));
    shiftId.addEventListener('change', (event) => handleChangeBooking(event.target, shiftPreviewInput, 'shift'));
    
    const handleChangeBooking = (selfEle, targetEle, type) => {
        let targetBindingValue;
        let valueOrigin;
        if (type === 'services') {
            valueOrigin = selfEle.selectedOptions[0].dataset.price;
            targetBindingValue = selfEle.selectedOptions[0].dataset.price;
            targetBindingValue = parseFloat(targetBindingValue).toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
        } else if (type === 'shift') {
            valueOrigin = selfEle.selectedOptions[0].dataset.shift;
            targetBindingValue = selfEle.selectedOptions[0].dataset.shift;
        }
        
        // Add data OrderList
        handleSetOrderSelected(orderSelected, type, valueOrigin);
        handleGetTotalPrice(orderSelected);
        
        targetEle.value = targetBindingValue;
    };
    
    const getSelected = (orderListSelected = [], type) => {
        let value = 0;
        const index = orderListSelected.findIndex((item) => item.type === type);
        
        if (index !== -1) {
            value = parseFloat(orderListSelected[index].price);
        }
        return { isSelected: index !== -1, value};
    };
    
    const handleSetOrderSelected  = (orderList, type, value) => {
        let indexOrder = orderList.findIndex((order) => order.type === type);
        if (indexOrder === -1) {
            orderSelected.push({ type, price:  value });
        } else {
            orderSelected[indexOrder] = { type, price:  value};
        };
    };
    
    const handleGetTotalPrice = (orderListSelected) => {
        const {isSelected: isHasServices, value: priceServices } = getSelected(orderListSelected, 'services');
        const {isSelected: isHasHall, value: priceHall } = getSelected(orderListSelected, 'hall');
        const { isSelected: isHasShift, value: coefficient } = getSelected(orderListSelected, 'shift');
        const { isSelected: isHasTables, value: countTables } = getSelected(orderListSelected, 'tables');
        const { isSelected: isHasFood, value: priceFood } = getSelected(orderListSelected, 'food');
        let priceTotal = 0;
        
        if (
                isHasServices && 
                isHasHall && 
                isHasShift && 
                isHasFood && 
                isHasTables
        ) {
            priceTotal = (priceServices + priceHall) * coefficient + priceFood * countTables;
        } else if (isHasServices && isHasHall && isHasShift) {
            priceTotal = (priceServices + priceHall) * coefficient;
        } else if (isHasServices && isHasHall) {
            priceTotal = priceServices + priceHall;
        } else {
            priceTotal = priceHall;
        }
        
        priceTotalFormated = parseFloat(priceTotal).toLocaleString('it-IT', {style: 'currency', currency: 'VND'});
        totalPriceBookingWeddingText.dataset.totalprice = priceTotal;
        totalPriceBookingWeddingText.textContent = priceTotalFormated;

        return priceTotal;
    };
    
    // Action submit form ((priceHall+ priceService)*coeficent + priceFood*maxTable) - (((priceHall+ priceService)*coeficent + priceFood*maxTable)*discountPay)

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
                    const inputCheckList = document.querySelectorAll(`.wrapper-foods-${cateElement.attributes.idcate.value} .form-check-input`);
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

                                countCheckCurrent -= 1;
                            }
                            
                            handleSetOrderSelected(orderSelected, 'food', totalPriceFoods);
                            handleGetTotalPrice(orderSelected);
                        };
                    });

                } else
                    alert("Đã có lỗi xảy ra!!!");
            }).catch((err) => {
                console.error(err);
            });
        });
    }

    // Set lại text Total Price
    totalPriceBookingWeddingText.dataset.totalprice = handleGetTotalPrice(orderSelected);

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
            
            handleSetOrderSelected(orderSelected, 'tables', event.target.valueAsNumber);    
            handleGetTotalPrice(orderSelected);
        };
    }

    // Submit form booking wedding
    submitFormWdUser.onclick = (e) => {
        // Disabled button submit
        e.target.disabled = true;
        spinnerAddWedding.classList.remove('visually-hidden');
        btnCloseForm.disabled = true;

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
                        "totalPrice": totalPriceBookingWeddingText.dataset.totalprice,
                        "quantityTable": quantityTableId.value,
                        "weddingservicesId": weddingServiceOptions.value,
                        "shiftId": shiftId.value,
                        "partyDate": partyDate.value,
                        "weddinghall": wdEle.dataset.weddinghallid

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
                    btnCloseForm.disabled = false;
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
                    btnCloseForm.disabled = false;
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
                    "totalPrice": totalPriceBookingWeddingText.dataset.totalprice,
                    "quantityTable": quantityTableId.value,
                    "weddingservicesId": weddingServiceOptions.value,
                    "shiftId": shiftId.value,
                    "partyDate": partyDate.value,
                    "weddinghall": wdEle.dataset.weddinghallid
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
                btnCloseForm.disabled = false;
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
                btnCloseForm.disabled = false;
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