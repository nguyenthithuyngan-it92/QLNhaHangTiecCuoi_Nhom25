/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhom25.controllers;

import com.nhom25.pojo.Food;
import com.nhom25.pojo.ListFood;
import com.nhom25.pojo.Orders;
import com.nhom25.pojo.Paymentmethods;
import com.nhom25.pojo.Shift;
import com.nhom25.pojo.User;
import com.nhom25.pojo.Weddinghall;
import com.nhom25.pojo.Weddingservices;
import com.nhom25.services.CategoryService;
import com.nhom25.services.OrdersService;
import com.nhom25.services.PaymentmethodsService;
import com.nhom25.services.UserService;
import com.nhom25.services.WeddingHallService;
import com.nhom25.services.WeddingServicesService;
import java.text.DecimalFormat;
//import com.nhom25.services.WeddingService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LENOVO
 */
@RestController
public class ApiBookingWedding {

    @Autowired
    private MailSender mailSender;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private WeddingHallService weddingHallService;

    @Autowired
    private WeddingServicesService weddingServicesService;

    @Autowired
    private UserService userService;

    @Autowired
    private PaymentmethodsService paymentmethodsService;

    @PostMapping(path = "/api/get-food-by-cateId", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Food>> getFoodByCateId(@RequestBody Map<String, String> params) {
        try {
            String cateId = params.get("cateId");

            List<Food> listFoods = this.categoryService.getFoodsByCategory(Integer.parseInt(cateId));

            return new ResponseEntity<>(listFoods, HttpStatus.OK);

        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/api/order-wedding", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Orders> bookingWedding(@RequestBody Map<String, String> params) {
        try {
            String userId = params.get("userId");
            String paymentId = params.get("paymentId");
            String weddinghallId = params.get("weddinghall");
            String weddingservicesId = params.get("weddingservicesId");
            String shiftId = params.get("shiftId");
            String totalPrice = params.get("totalPrice");
            String quantityTable = params.get("quantityTable");
            String partyDate = params.get("partyDate");

            Date partyDateTransform = new SimpleDateFormat("yyyy-MM-dd").parse(partyDate);

            Weddinghall wd = this.weddingHallService.getWeddingHallById(Integer.parseInt(weddinghallId));
            Weddingservices ws = this.weddingServicesService.getWeddingServiceById(Integer.parseInt(weddingservicesId));
            Shift sh = this.ordersService.getShiftById(Integer.parseInt(shiftId));
            User user = this.userService.getUserById(Integer.parseInt(userId));
            Paymentmethods payMt = this.paymentmethodsService
                    .getPaymentmethodsById(Integer.parseInt(paymentId));

            Orders orderTemp = new Orders();
            orderTemp.setTotalPrice(Long.parseLong(totalPrice));
            orderTemp.setWeddinghallId(wd);
            orderTemp.setWeddingservicesId(ws);
            orderTemp.setShiftId(sh);
            orderTemp.setUserId(user);
            orderTemp.setPaymentmethodsId(payMt);
            orderTemp.setPartyDate(partyDateTransform);
            orderTemp.setQuantityTable(Integer.parseInt(quantityTable));

            Orders order = this.ordersService.addOrders(orderTemp);

            return new ResponseEntity<>(order, HttpStatus.CREATED);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/api/order-food/{orderId}", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<?> bookingFood(@PathVariable(value = "orderId") int orderId, @RequestBody ListFood foods) {
        try {
            //send mail
            Orders o = this.ordersService.getOrdersById(orderId);
            User u = userService.getUserById(o.getUserId().getUserId());
            Weddinghall h = weddingHallService.getWeddingHallById(o.getWeddinghallId().getWeddinghallId());
            Weddingservices s = weddingServicesService.getWeddingServiceById(o.getWeddingservicesId().getWeddingservicesId());
            Shift sh = ordersService.getShiftById(o.getShiftId().getShiftId());

            //format date
            SimpleDateFormat fmDate = new SimpleDateFormat("dd-MM-yyyy");
            //format price
            DecimalFormat fmPrice = new DecimalFormat("###,###,###");

            sendMail("1951052129ngan@ou.edu.vn", u.getEmail(), "?????t ti???c c?????i th??nh c??ng - Nh?? h??ng ti???c c?????i White Palace",
                    "Ch??c m???ng qu?? kh??ch " + u.getName() + " ???? ?????t ti???c c?????i th??nh c??ng v???i m?? h??a ????n " + String.valueOf(o.getOrderId())
                    + ". Qu?? kh??ch vui l??ng ki???m tra l???i th??ng tin ?????t ti???c sau: "
                    + "\n   + S???nh ti???c: " + String.valueOf(h.getName())
                    + "\n   + G??i d???ch v???: " + String.valueOf(s.getName())
                    + "\n   + Ng??y t??? ch???c ti???c c?????i: " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + "\n   + Ca t??? ch???c ti???c: " + String.valueOf(sh.getName())
                    + "\n   + S??? l?????ng b??n ti???c: " + String.valueOf(o.getQuantityTable()) + " b??n"
                    + "\n   + T???ng ti???n h??a ????n: " + String.valueOf(fmPrice.format(o.getTotalPrice())) + " VN??"
                    + "\nN???u th??ng tin tr??n ???? ch??nh x??c, qu?? kh??ch vui l??ng ?????n nh?? h??ng thanh to??n h??a ????n tr?????c ng??y " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + ".\nN???u th??ng tin c?? sai s??t vui l??ng li??n h??? v???i ch??ng t??i b???ng c??ch ph???n h???i l???i mail n??y ????? ??i???u ch???nh th??ng tin tr?????c ng??y " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + ".\nC???m ??n qu?? kh??ch ???? tin t?????ng v?? l???a ch???n ch??ng t??i!!"
                    + "\nWhite Palace."
            );

            return new ResponseEntity<>(this.ordersService.saveOrders(foods, orderId), HttpStatus.CREATED);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

    }

    @GetMapping(path = "/api/confirm-booking/{orderId}", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<?> confirmBooking(@PathVariable(value = "orderId") int orderId) {

        //send mail
        Orders o = this.ordersService.getOrdersById(orderId);
        User u = userService.getUserById(o.getUserId().getUserId());
        //format date
        SimpleDateFormat fmDate = new SimpleDateFormat("dd-MM-yyyy");
        //format price
        DecimalFormat fmPrice = new DecimalFormat("###,###,###");

        sendMail("1951052129ngan@ou.edu.vn", u.getEmail(), "Thanh to??n h??a ????n - Nh?? h??ng ti???c c?????i White Palace",
                "Q??y kh??ch ???? thanh to??n h??a ????n " + String.valueOf(o.getOrderId())
                + " v???i t???ng s??? ti???n l?? " + String.valueOf(fmPrice.format(o.getTotalPrice())) + " VN??"
                + " v??o ng??y " + String.valueOf(fmDate.format(new Date()))
                + ".\nC???n ??n qu?? kh??ch ???? thanh to??n h??a ????n ????ng h???n. Ch??ng t??i r???t h??n h???nh ???????c ph???c v??? qu?? kh??ch!!"
                + "\nWhite Palace."
        );
        return new ResponseEntity<>(this.ordersService.confirmBooking(orderId), HttpStatus.OK);

    }

    public void sendMail(String from, String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }
}
