package com.example.demo.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Cart;


import com.example.demo.entity.Underwear;
import com.example.demo.entity.Users;
import com.example.demo.repository.IUnderwearRepository;
import com.example.demo.service.CartService;
import com.example.demo.service.impl.CartServiceImpl;
import com.example.demo.service.impl.UsersService;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	HttpSession session;
			
	@Autowired
	private IUnderwearRepository underRepo;
	
	@Autowired
	private CartServiceImpl cartService;
	
	@Autowired
	private UsersService userService;
	
	@Autowired 
	HttpServletRequest request;
	
	@GetMapping
	public String viewCart(ModelMap modelMap, Model model) {
		Long iduser = ((Users) request.getSession().getAttribute("userxc")).getId();
		List<Cart> cart = cartService.listCart(userService.find(iduser));
		modelMap.addAttribute("cart", cart);
		modelMap.put("title", "Cart");
		modelMap.put("action", "cart");
		
		return "cart/cart";
	}
	
	
//	@GetMapping
//	public String index(Model model) {
//		List<DetailOrder> list =  (List<DetailOrder>) session.getAttribute("listCart");
//		model.addAttribute("list", list);
//		return "cart/cart";
//	}
//	
//	@GetMapping("/delete")
//	public String delete(@RequestParam("id") Long id, Model model) {
//		List<DetailOrder> list =  (List<DetailOrder>) session.getAttribute("listCart");
//		for (DetailOrder detailOrder : list) {
//			if (detailOrder.getUnderwear().getId() == id) {
//				list.remove(id);
//				break;
//			}
//		}
//		session.setAttribute("listCart", list);
//		return "redirect:/order";
//	}
//	
//	@PostMapping("/update-number")
//	public String update(@RequestParam("id") Long id, Model model, @RequestParam("soLuong") int soLuong) {
//		List<DetailOrder> list =  (List<DetailOrder>) session.getAttribute("listCart");
//		for (DetailOrder detailOrder : list) {
//			if (detailOrder.getUnderwear().getId() == id) {
//				detailOrder.setSoLuong(soLuong);
//				break;
//			}
//		}
//		model.addAttribute("list", list);
//		return "redirect:/order";
//	}
//	
//	@GetMapping("/buy")
//	public String buy() {
//		List<DetailOrder> list =  (List<DetailOrder>) session.getAttribute("listCart");
//		Orders order = new Orders();
//		order.setDiaChi("Ha noi");
//		order.setStatus(1);
//		BigDecimal total = new BigDecimal(0);
//		for (DetailOrder detailOrder : list) {
//			Underwear underWear = underRepo.getById(detailOrder.getUnderwear().getId());
//			underWear.setQuatity(underWear.getQuatity()-detailOrder.getSoLuong());
//			underRepo.save(underWear);
//			detailOrderRepo.save(detailOrder);
//			total = total.add(detailOrder.getTotal());
//		}
//		orderRepo.save(order);
//		session.setAttribute("listCart", new ArrayList<DetailOrder>());
//		return "";
//	}
	
////	
//	@GetMapping("/add-cart")
//	public String addCart(@RequestParam("id") Long id, Model model) {
//		List<DetailOrder> list = (List<DetailOrder>) session.getAttribute("listCart");
//		Underwear under = underRepo.getById(id);
//		if (list == null || list.isEmpty()) {
//			
//			DetailOrder detailOrder = new DetailOrder();
//			detailOrder.setSoLuong(1);
//			detailOrder.setStatus(1);
//			detailOrder.setTotal(under.getPrice());
//			detailOrder.setUnderwear(under);
//			list = new ArrayList<DetailOrder>();
//			list.add(detailOrder);
//		} else {
//			boolean flag = false;
//			for (DetailOrder detailOrder : list) {
//				if (detailOrder.getUnderwear().getId() == id) {
//					detailOrder.setSoLuong(detailOrder.getSoLuong()+1);
//					flag = true;
//					break;
//				}
//			}
//			if (flag == true) {
//				DetailOrder detailOrder = new DetailOrder();
//				detailOrder.setSoLuong(1);
//				detailOrder.setStatus(1);
//				detailOrder.setTotal(under.getPrice());
//				detailOrder.setUnderwear(under);
//				list.add(detailOrder);
//			}
//		}
//		session.setAttribute("listCart", list);
//		return "redirect:/order";
//	}
	
	@GetMapping("/buy/{id}/{quantity}")
	public String buyUnderwear(@PathVariable("id")Long id, @PathVariable("quantity")Integer quantity) {
		Long iduser = ((Users) request.getSession().getAttribute("userxc")).getId();
		cartService.addUnderwear(id, quantity, userService.find(iduser));
		return "redirect:/cart";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteCart(@PathVariable("id")Long id) {
		cartService.delete(id);
		return "redirect:/cart";
	}
	
	@GetMapping("/buy")
	public String buy(ModelMap modelMap) {
		return"";
	}
}
