package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.Cart;
import com.example.demo.entity.Underwear;
import com.example.demo.entity.Users;

public interface ICartRepository extends JpaRepository<Cart, Long>{
	public List<Cart> findByUser(Users user);
	
	@Query("SELECT c FROM Cart c WHERE c.user.id = ?1")
	public List<Cart> findAll(Long id);
	
	public Cart findByUserAndUnderwear(Users user, Underwear underwear);
}
