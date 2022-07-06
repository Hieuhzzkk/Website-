package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.OrderDetail;
import com.example.demo.entity.OrderDetailId;

public interface IOrderDetailRepository extends JpaRepository<OrderDetail, OrderDetailId> {
	@Query("SELECT DISTINCT o FROM OrderDetail o JOIN o.order o1 WHERE o1.customerName LIKE %?1%")
	public List<OrderDetail> listByName(String name);
}
