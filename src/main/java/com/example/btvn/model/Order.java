package com.example.btvn.model;

import java.util.Date;

public class Order {
    private String orderId;
    private String productName;
    private Double amount;
    private Date orderDate;

    public Order() {
    }

    public Order(String orderId, String productName, Double amount, Date orderDate) {
        this.orderId = orderId;
        this.productName = productName;
        this.amount = amount;
        this.orderDate = orderDate;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
