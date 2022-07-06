package com.example.demo.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entity.Users;

public interface IUsersReposetory extends JpaRepository<Users, Long>{
	@Query("SELECT o FROM Users o WHERE o.email LIKE %?1%")
	public Users findByEmail(String email);
	@Query("SELECT o FROM Users o WHERE o.email LIKE %?1%")
	public Users findByPass(String pass);
	
	@Query("SELECT o FROM Users o WHERE o.name LIKE %?1% OR o.id LIKE %?1%")
	public Page<Users> findAllType(String keyWord, Pageable pageable);
}
