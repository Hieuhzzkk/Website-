package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


import com.example.demo.entity.Underwear;
import com.example.demo.repository.IUnderwearRepository;
import com.example.demo.service.IUnderwearService;


@Service
public class UnderwearService implements IUnderwearService{	
	@Autowired
	private IUnderwearRepository repository;
	
	public Page<Underwear> getAll(String keyWord, Pageable pageable){
		return repository.findAllType(keyWord, pageable);
	}
	
	public List<Underwear> getAll2(){
		return repository.findAll();
	}
	
	public void save(Underwear underwear) {
		repository.save(underwear);
	}
	
	public Optional<Underwear> update (Long id,Underwear underwear) {
		Underwear underwearOld = repository.getById(id);
		underwear.setImg(underwearOld.getImg());
		return repository.findById(id);
	}
	
	public void delete(Long id){
		repository.deleteById(id);
	}
	
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
	
	public Underwear find(Long id) {
		 Optional < Underwear > optional = repository.findById(id);
	        Underwear pant = null;
	        if (optional.isPresent()) {
	           pant = optional.get();
	        } else {
	            throw new RuntimeException(" Pant not found for id :: " + id);
	        }
	        return pant;
	}
}
