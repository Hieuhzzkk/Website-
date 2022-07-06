package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Cart;
import com.example.demo.entity.Underwear;
import com.example.demo.entity.Users;
import com.example.demo.repository.ICartRepository;
import com.example.demo.repository.IUnderwearRepository;
import com.example.demo.service.CartService;

@Repository
public class CartServiceImpl implements CartService{

	@Autowired
	private ICartRepository cartRepo;
	@Autowired
	private IUnderwearRepository underRepo;
	
	public CartServiceImpl(ICartRepository cartRepo) {
		this.cartRepo = cartRepo;
	}
	@Override
	public List<Cart> getAll(Long iduser) {		
		return cartRepo.findAll(iduser);
	}

	@Override
	public Integer addUnderwear(Long underId, Integer quantity, Users user) {
		Integer addedQuantity = quantity;
		Underwear underwear = underRepo.findById(underId).get();
		Cart cart = cartRepo.findByUserAndUnderwear(user, underwear);
		
		if (cart!=null) {
			addedQuantity = cart.getQuantity()+quantity;
			cart.setQuantity(addedQuantity);
		}else {
			cart = new Cart();
			cart.setQuantity(quantity);
			cart.setUser(user);
			cart.setUnderwear(underwear);
		}
		cartRepo.save(cart);
		return addedQuantity;
	}

	@Override
	public List<Cart> listCart(Users user) {
		return cartRepo.findByUser(user);
	}
	
	public void delete(Long id) {
		if (id!=null) {
			Optional<Cart> cart = cartRepo.findById(id);
			if (cart.isPresent()) {
				cartRepo.deleteById(id);
				cart.get();
				return;
			}
		}
		return;
	}
	
	public Cart update(Long id) {
		Optional<Cart> optional = cartRepo.findById(id);
		Cart cart = null;
		if (optional.isPresent()) {
			cart = optional.get();
		}else {
			throw new RuntimeException("Cart not found for id:: " + id);
		}
		return cart;
	}
//	@Override
//	public List<Cart> getAll(Integer id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
}
