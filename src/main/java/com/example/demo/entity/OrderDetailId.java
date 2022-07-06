package com.example.demo.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
@Embeddable
public class OrderDetailId implements Serializable {
	private Long underwearId;
	private Long orderId;
	
	public OrderDetailId() {
		super();
	}

	public OrderDetailId(Long underwearId, Long orderId) {
		super();
		this.underwearId = underwearId;
		this.orderId = orderId;
	}

	public Long getUnderwearId() {
		return underwearId;
	}

	public void setUnderwearId(Long underwearId) {
		this.underwearId = underwearId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	
	
}
