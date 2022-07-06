package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.OrderDetail;

public interface OrderDetailService {
	public List<OrderDetail> listOrderDetails(String name);
	public OrderDetail create(OrderDetail orderDetail);
}
