package com.example.demo.entity;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail")
public class OrderDetail  implements Serializable{
	
	@Id
	private OrderDetailId id;
	
	@ManyToOne
	@JoinColumn(name = "orderId", insertable = false, updatable = false)
	private Order order;
	
	@ManyToOne
	@JoinColumn(name = "underwearId", insertable = false, updatable = false)
	private Underwear underwear;
	
	@Column
	private BigDecimal price;
	@Column
	private Integer quantity;
	
	public OrderDetail() {
		super();
	}

	public OrderDetail(OrderDetailId id, Order order, Underwear underwear, BigDecimal price, Integer quantity) {
		super();
		this.id = id;
		this.order = order;
		this.underwear = underwear;
		this.price = price;
		this.quantity = quantity;
	}

	public OrderDetailId getId() {
		return id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Underwear getUnderwear() {
		return underwear;
	}

	public void setUnderwear(Underwear underwear) {
		this.underwear = underwear;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
}
