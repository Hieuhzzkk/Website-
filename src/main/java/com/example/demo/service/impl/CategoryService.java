package com.example.demo.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.entity.Categories;
import com.example.demo.repository.ICategoryReposetory;

@Service
public class CategoryService {
	@Autowired
	private ICategoryReposetory reposytory;
	
	public List<Categories> getAll(){
		return reposytory.findAll();
	}
	
	public void add(Categories category) {
		reposytory.save(category);
	}
	
	public Categories update(Long id) {
		Optional < Categories > optional = reposytory.findById(id);
        Categories categories = null;
        if (optional.isPresent()) {
            categories = optional.get();
        } else {
            throw new RuntimeException(" Category not found for id :: " + id);
        }
        return categories;
    }	
	
	public void delete(Long id) {
		reposytory.deleteById(id);
	}	
}
