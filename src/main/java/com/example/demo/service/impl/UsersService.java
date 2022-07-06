package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


import com.example.demo.entity.Users;
import com.example.demo.repository.IUsersReposetory;
import com.example.demo.service.IUsersService;
@Service
public class UsersService implements IUsersService{
	@Autowired
	private IUsersReposetory repository;
	
	public Page<Users> getAll(String keyWord, Pageable pageable){
		return repository.findAllType(keyWord, pageable);
	}
		
	
	public List<Users> getAll2(){
		return repository.findAll();
	}
	
	public void save(Users user) {
		repository.save(user);
	}
	
	public Optional<Users> update (Long id) {
		return repository.findById(id);
	}
	
	public void delete(Long id){
		repository.deleteById(id);
	}
	
	@Override
	public Page<Users> getByPage(int pageNumber, int maxRecord) {
		Pageable pageable = PageRequest.of(pageNumber, maxRecord);
		Page<Users> page = repository.findAll(pageable);
		return page;
	}

	@Override
	public Page<Users> getByType(int pageNumber, int maxRecord, String keyWord) {
		Pageable pageable = PageRequest.of(pageNumber, maxRecord);
		Page<Users> page = repository.findAllType(keyWord,pageable);
		return page;
	}
	
	public Users find(Long id) {
		Optional<Users> optional = repository.findById(id);
		Users user = null;
		if (optional.isPresent()) {
			user = optional.get();
		}else {
            throw new RuntimeException(" User not found for id :: " + id);
        }
		return user;
	}
}
