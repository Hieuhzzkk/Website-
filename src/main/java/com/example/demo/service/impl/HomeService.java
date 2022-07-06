package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Underwear;
import com.example.demo.repository.IHomeRepository;
import com.example.demo.service.IHomeService;
@Service
public class HomeService implements IHomeService{
	
	@Autowired
	private IHomeRepository repository;
	public Page<Underwear> getAll(String keyWord, Pageable pageable){
		return repository.findAllType(keyWord, pageable);
	}
	
	public List<Underwear> getAll2(){
		return repository.findAll();
	}
	
	public Optional<Underwear> viewDetail (Long id) {
		return repository.findById(id);
	}
	
	@Override
	public Page<Underwear> getByPage(int pageNumber, int maxRecord) {
		Pageable pageable = PageRequest.of(pageNumber, maxRecord);
		Page<Underwear> page = repository.findAll(pageable);
		return page;
	}

	@Override
	public Page<Underwear> getByType(int pageNumber, int maxRecord, String keyWord) {
		Pageable pageable = PageRequest.of(pageNumber, maxRecord);
		Page<Underwear> page = repository.findAllType(keyWord,pageable);
		return page;
	}

}
