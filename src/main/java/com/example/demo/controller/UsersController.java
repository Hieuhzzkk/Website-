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


import com.example.demo.entity.Users;
import com.example.demo.service.impl.UsersService;
import com.example.demo.utility.CommonConst;

@Controller
@RequestMapping("/user")
public class UsersController {
	@Autowired
	private UsersService service;
	
	@GetMapping
	public String getAll(Model model, @RequestParam(name="pageNumber" ,defaultValue = "0") int pageNumber) {
		Page<Users> userPage = service.getByPage(pageNumber, CommonConst.PAGE_SIZE);
		List<Users> user =  service.getAll2();		
		model.addAttribute("user",user);
		model.addAttribute("userPage", userPage);
		return "users/user";
	}
	
	@PostMapping("/create")
	public String create(Model model,@ModelAttribute("user")Users user) {
		model.addAttribute("user", user);
		service.save(user);
		return "redirect:/user";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute("user")Users user,@RequestParam Long id) {
		service.update(id);
		service.save(user);
		return "redirect:/user";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam Long id) {
		service.delete(id);
		return "redirect:/user"; 
	}
	
	@GetMapping("/search")
	public String listByPage(Model model,@Param("keyWord")String keyWord, 
			 @RequestParam(name="pageNumber" ,defaultValue = "0") int pageNumber) {
		List<Users> user = service.getAll2();
		Page<Users> userPage = service.getByType(pageNumber, CommonConst.PAGE_SIZE,keyWord);	
		model.addAttribute("user",user);
		model.addAttribute("userPage",userPage);
		model.addAttribute("keyWord",keyWord);		
		return "users/user";
	}
}
