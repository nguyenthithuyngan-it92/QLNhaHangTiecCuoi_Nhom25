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

            sendMail("1951052129ngan@ou.edu.vn", u.getEmail(), "Đặt tiệc cưới thành công - Nhà hàng tiệc cưới White Palace",
                    "Chúc mừng quý khách " + u.getName() + " đã đặt tiệc cưới thành công với mã hóa đơn " + String.valueOf(o.getOrderId())
                    + ". Quý khách vui lòng kiểm tra lại thông tin đặt tiệc sau: "
                    + "\n   + Sảnh tiệc: " + String.valueOf(h.getName())
                    + "\n   + Gói dịch vụ: " + String.valueOf(s.getName())
                    + "\n   + Ngày tổ chức tiệc cưới: " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + "\n   + Ca tổ chức tiệc: " + String.valueOf(sh.getName())
                    + "\n   + Số lượng bàn tiệc: " + String.valueOf(o.getQuantityTable()) + " bàn"
                    + "\n   + Tổng tiền hóa đơn: " + String.valueOf(fmPrice.format(o.getTotalPrice())) + " VNĐ"
                    + "\nNếu thông tin trên đã chính xác, quý khách vui lòng đến nhà hàng thanh toán hóa đơn trước ngày " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + ".\nNếu thông tin có sai sót vui lòng liên hệ với chúng tôi bằng cách phản hồi lại mail này để điều chỉnh thông tin trước ngày " + String.valueOf(fmDate.format(o.getPartyDate()))
                    + ".\nCảm ơn quý khách đã tin tưởng và lựa chọn chúng tôi!!"
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

        sendMail("1951052129ngan@ou.edu.vn", u.getEmail(), "Thanh toán hóa đơn - Nhà hàng tiệc cưới White Palace",
                "Qúy khách đã thanh toán hóa đơn " + String.valueOf(o.getOrderId())
                + " với tổng số tiền là " + String.valueOf(fmPrice.format(o.getTotalPrice())) + " VNĐ"
                + " vào ngày " + String.valueOf(fmDate.format(new Date()))
                + ".\nCản ơn quý khách đã thanh toán hóa đơn đúng hạn. Chúng tôi rất hân hạnh được phục vụ quý khách!!"
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
