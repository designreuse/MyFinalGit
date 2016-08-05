package com.niit.musichub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String home()
	{
		System.out.println("hello");
		return "index";
	}
	
	@RequestMapping("/index")
	public String homeTry()
	{
		System.out.println("hello");
		return "FrontEnd/index";
	}
	
	@RequestMapping("contactUs")
	public String contactUs()
	{
		System.out.println("hello");
		return "aboutUs";
	}

	@RequestMapping("login")
	public String Login()
	{
		System.out.println("hello");
		return "login";
	}
	
	@RequestMapping("allProducts")
	public String allProducts()
	{
		System.out.println("hello");
		return "AllProducts";
	}
	
}
