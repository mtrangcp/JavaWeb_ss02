package com.example.btvn.controller;

import com.example.btvn.model.Order;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {
    @GetMapping("/orders")
    public String listOrders(HttpSession session, HttpServletRequest request) {
        // 1. Kiểm tra bảo mật (Session Scope)
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        List<Order> orders = new ArrayList<>();
        orders.add(new Order("ORD001", "Laptop Dell", 15000000.0, new Date()));
        orders.add(new Order("ORD002", "Chuột Logitech", 500000.0, new Date()));
        request.setAttribute("orderList", orders);

        ServletContext application = request.getServletContext();
        synchronized (application) {
            Integer count = (Integer) application.getAttribute("totalViewCount");
            if (count == null) count = 0;
            application.setAttribute("totalViewCount", count + 1);
        }

        return "orders";
    }
}
