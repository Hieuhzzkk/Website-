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
import com.example.demo.repository.IHomeRepository;
import com.example.demo.service.IHomeService;
import com.example.demo.service.IUnderwearService;
import com.example.demo.service.impl.CategoryService;
import com.example.demo.service.impl.HomeService;
import com.example.demo.service.impl.UnderwearService;
import com.example.demo.utility.CommonConst;


@Controller
@RequestMapping("/home")
public class HomeController {	
	@Autowired
	private UnderwearService service;
	@Autowired
	private CategoryService cateService;
	@Autowired
	private IUnderwearService underService;
	@Autowired
	private HomeService homeService;
	@Autowired
	private IHomeRepository homeRepository;
	@GetMapping
	public String getAll(Model model, @RequestParam(name="pageNumber" ,defaultValue = "0") int pageNumber) {
		Page<Underwear> underPage = underService.getByPage(pageNumber, CommonConst.PAGE_SIZE);
		List<Underwear> underwear =  service.getAll2();
		List<Categories> category = cateService.getAll();
		model.addAttribute("underwear",underwear);
		model.addAttribute("category",category);
		model.addAttribute("underPage", underPage);
		return "home";
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
		return "home";
	}
}
