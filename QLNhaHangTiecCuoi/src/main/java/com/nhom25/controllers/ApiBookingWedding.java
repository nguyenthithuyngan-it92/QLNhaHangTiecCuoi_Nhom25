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

            sendMail("1951052129ngan@ou.edu.vn", u.getEmail(), "Dat tiec cuoi thanh cong - Nha hang tiec cuoi White Palace",
                    "Chuc mung quy khach " + u.getName() + " da dat tiec cuoi thanh cong voi ma hoa don " + String.valueOf(o.getOrderId())
                    + ". Quy khach vui long kiem tra nhung thong tin dat tiec sau: "
                    + "\n   + Sanh tiec: " + String.valueOf(h.getName())
                    + "\n   + Goi dich vu: " + String.valueOf(s.getName())
                    + "\n   + Ngay to chuc tiec cuoi: " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + "\n   + Ca to chuc tiec: " + String.valueOf(sh.getName())
                    + "\n   + So luong ban tiec: " + String.valueOf(o.getQuantityTable()) + " bàn"
                    + "\n   + Tong tien hoa don: " + String.valueOf(fmPrice.format(o.getTotalPrice())) + " VNĐ"
                    + "\nNeu thong tin tren da chinh xac thi quy khach can den nha hang thanh toan hoa don truoc ngay " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + "\nNeu thong tin co sai sot vui long lien he voi chung toi bang cach phan hoi lai qua mail nay de dieu chinh thong tin truoc ngay " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + "\nCam on quy khach da tin tuong va lua chon nha hang chung toi!!"
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

        sendMail("1951052129ngan@ou.edu.vn", u.getEmail(), "Thanh toan hoa don - Nha hang tiec cuoi White Palace",
                "Quy khach da thanh toan hoa don " + String.valueOf(o.getOrderId())
                + " voi tong so tien la " + String.valueOf(fmPrice.format(o.getTotalPrice())) + " VNĐ "
                + " vao ngay " + String.valueOf(fmDate.format(new Date()))
                + "\nCam on quy khach da thanh toan hoa don dung han. Chung toi rat han hanh duoc phuc vu quy khach!!"
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
