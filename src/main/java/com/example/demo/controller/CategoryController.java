package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Categories;
import com.example.demo.service.impl.CategoryService;

@Controller
@RequestMapping("category")
public class CategoryController {
	@Autowired
	private CategoryService service;
	
	@GetMapping
	public String getAll(ModelMap modelMap) {
		List<Categories> category = service.getAll();
		modelMap.addAttribute("category", category);
		return "category/category"; 
	}
	
	@PostMapping("/create") 
	public String create(Model model,@ModelAttribute("category") Categories category) {
			model.addAttribute("category", category);
			service.add(category);
			return "redirect:/category";
		}
	@PostMapping("/update")
	public String update(@ModelAttribute("cate") Categories category, @RequestParam Long id) {
		service.update(id);
		service.add(category);
		return "redirect:/category";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam Long id) {
		service.delete(id);
		return "redirect:/category"; 
	}	
	
	}


