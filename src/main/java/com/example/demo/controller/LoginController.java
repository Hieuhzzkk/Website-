package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Users;
import com.example.demo.repository.IUsersReposetory;
import com.example.demo.service.impl.UsersService;
import com.example.demo.utility.EncryptUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired
	private UsersService userService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	@Autowired
	private IUsersReposetory userRepo;
	
	@GetMapping("/login")
	public String signIn() {
		return "login/login";
	}
	
	@PostMapping("/login")
	public String processLogin(@RequestParam(name="email",required = true)String email,
			@RequestParam(name="pass",required = true)String pass) {
		Users user = this.userRepo.findByEmail(email);
		Users userPass = this.userRepo.findByPass(pass);
		session = request.getSession();
		session.setAttribute("userxc", user);
		session.setAttribute("passxc", userPass);
		if (user==null&&userPass==null) {
			session.setAttribute("error", "Wrong email or password!!!");
			return "redirect:/login";
		}
//		boolean checkPass = EncryptUtil.check(pass, user.getPass());
//		if (!checkPass) {
//			session.setAttribute("error", "Wrong email or password!!!");
//			return "redirect:/login";
//		}
		return "redirect:/home";
	}
	
	@GetMapping("/logout")
	public String logOut() {
		HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("userxc");       
        }
        return "redirect:/home/";
	}
	
	@GetMapping("/process_register")
	public String processRegistration(Users user) {
		String encrypted = EncryptUtil.encrypt(request.getParameter("pass"));
		user.setPass(encrypted);
		userService.save(user);		
		return "register-message";
	}
}
