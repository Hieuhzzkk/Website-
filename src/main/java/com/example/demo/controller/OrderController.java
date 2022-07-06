package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.Cart;
import com.example.demo.entity.Order;
import com.example.demo.entity.OrderDetail;
import com.example.demo.entity.OrderDetailId;
import com.example.demo.entity.Underwear;
import com.example.demo.entity.Users;
import com.example.demo.repository.ICartRepository;
import com.example.demo.service.OrderService;
import com.example.demo.service.impl.CartServiceImpl;
import com.example.demo.service.impl.OrderDetailImpl;
import com.example.demo.service.impl.OrderServiceImpl;
import com.example.demo.service.impl.UnderwearService;
import com.example.demo.service.impl.UsersService;

@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
	private HttpSession session;

	@Autowired
	private UnderwearService underwearService;

	@Autowired
	private CartServiceImpl cartServices;

	@Autowired
	private UsersService userService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private OrderServiceImpl orderService;

	@Autowired
	private ICartRepository repository;
	
	@Autowired
	private OrderDetailImpl orderDetailService;

	@GetMapping("")
	public String viewOrder(ModelMap modelMap,Model model) {
		String name = ((Users) request.getSession().getAttribute("userxc")).getName();
		List<OrderDetail> listOrderDetails = orderDetailService.listOrderDetails(name);
		modelMap.addAttribute("order",listOrderDetails);
		return "order/index";
	}
	
	
	@GetMapping("/checkout")
	public String checkOut() {
		Long iduser = ((Users) request.getSession().getAttribute("userxc")).getId();
		String name = ((Users) request.getSession().getAttribute("userxc")).getName();
		
			Order orders = new Order();
			orders.setName("New Order");
			orders.setStatus(false);
			orders.setCustomerName(name);
			Long newOrderID =  orderService.create(orders).getId();
			List<Cart> cart = cartServices.getAll(iduser);
			for (Cart x : cart) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setId(new OrderDetailId(x.getUnderwear().getId(),newOrderID));
				orderDetail.setPrice(x.getUnderwear().getPrice());
				orderDetail.setQuantity(x.getQuantity());
				Underwear purchased = underwearService.find(x.getUnderwear().getId());
				orderDetailService.create(orderDetail);
				purchased.setQuatity(purchased.getQuatity()- x.getQuantity());
		        repository.deleteAllInBatch(cart);
			

		}
		return "redirect:/cart/";
	}
}
