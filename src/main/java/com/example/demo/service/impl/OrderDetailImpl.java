package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.OrderDetail;
import com.example.demo.repository.IOrderDetailRepository;
import com.example.demo.service.OrderDetailService;

@Service
public class OrderDetailImpl implements OrderDetailService {
	@Autowired
	private IOrderDetailRepository repository;

	@Override
	public List<OrderDetail> listOrderDetails(String name) {
		return repository.listByName(name);
	}

	@Override
	public OrderDetail create(OrderDetail orderDetail) {
		return repository.save(orderDetail);
	}
}
