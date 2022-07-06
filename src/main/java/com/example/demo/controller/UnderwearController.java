package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Categories;
import com.example.demo.entity.Underwear;
import com.example.demo.service.IUnderwearService;
import com.example.demo.service.impl.CategoryService;
import com.example.demo.service.impl.UnderwearService;
import com.example.demo.utility.CommonConst;




@Controller
@RequestMapping("/underwear")
public class UnderwearController {
	@Autowired
	private UnderwearService service;
	@Autowired
	private CategoryService cateService;
	@Autowired
	private IUnderwearService underService;

	
//	@GetMapping("/get-all")
//	public String view(Model model) {
//		List<Underwear> underwear =  service.getAll2();
//		List<Categories> category = cateService.getAll();
//		model.addAttribute("underwear",underwear);
//		model.addAttribute("category",category);
//		return "underwear/underwear";
//	}
			
	@PostMapping("/create")
	public String create(Model model,@ModelAttribute("underwear")Underwear underwear) {
		model.addAttribute("underwear", underwear);
		service.save(underwear);
		return "redirect:/underwear";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("underwear")Underwear underwear,@RequestParam Long id) {
		service.update(id, underwear);
		service.save(underwear);
		return "redirect:/underwear";
	}
		
	@GetMapping("/delete")
	public String delete(@RequestParam Long id) {
		service.delete(id);
		return "redirect:/underwear"; 
	}
	
	@GetMapping
	public String getAll(Model model, @RequestParam(name="pageNumber" ,defaultValue = "0") int pageNumber) {
		Page<Underwear> underPage = underService.getByPage(pageNumber, CommonConst.PAGE_SIZE);
		List<Underwear> underwear =  service.getAll2();
		List<Categories> category = cateService.getAll();
		model.addAttribute("underwear",underwear);
		model.addAttribute("category",category);
		model.addAttribute("underPage", underPage);
		return "underwear/underwear";
	}
	
	@GetMapping("/search")
	public String listByPage(Model model,@Param("keyWord")String keyWord, 
			 @RequestParam(name="pageNumber" ,defaultValue = "0") int pageNumber) {
		List<Categories> category = cateService.getAll();
		Page<Underwear> underPage = underService.getByType(pageNumber, CommonConst.PAGE_SIZE,keyWord);
		List<Underwear> underwear =  service.getAll2();
		model.addAttribute("underwear",underwear);
		model.addAttribute("category",category);
		model.addAttribute("underPage", underPage);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("category",category);
		return "underwear/underwear";
	}
}
