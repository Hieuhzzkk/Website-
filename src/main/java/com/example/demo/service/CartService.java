package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.Cart;
import com.example.demo.entity.Users;

public interface CartService {
	public List<Cart> getAll(Long id);
	public Integer addUnderwear(Long underId, Integer quantity, Users user );
	List<Cart> listCart(Users user );
}
