package com.niit.musichub.controller.admin;

import java.nio.file.Path;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.musichub.DAO.ProductDAO;
import com.niit.musichub.model.Product;

@Controller
@RequestMapping("/admin")
public class AdminController {

	/*@Autowired
	ProductDAO pdi;
*/
	private Path path; 
	
	@RequestMapping
	public String Home(){
		return "admin";
	}
	
}
