package com.niit.musichub.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.musichub.Service.BillingAddressService;
import com.niit.musichub.Service.ShippingAddressService;
import com.niit.musichub.Service.UserService;
import com.niit.musichub.model.BillingAddress;
import com.niit.musichub.model.Category;
import com.niit.musichub.model.Product;
import com.niit.musichub.model.ShippingAddress;
import com.niit.musichub.model.Supplier;
import com.niit.musichub.model.User;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	ShippingAddressService shippingAddressService;
	
	@Autowired
	BillingAddressService billingAddressService;
	
	private Path path;
	
	/*@RequestMapping(value= "/userLogin", method= RequestMethod.GET)
	public ModelAndView list() {
		List<User> list = userService.getAllUsers();
		return new ModelAndView("userLogin", "user", list);
	}*/
	
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET)
	public String listProducts(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("shippingAddress", new ShippingAddress());
		model.addAttribute("billingAddress", new BillingAddress());
		model.addAttribute("userList", this.userService.getAllUsers());
		model.addAttribute("billingAddressList", this.billingAddressService.getAllBillingAddress());
		model.addAttribute("shippingAddressList", this.shippingAddressService.getAllShippingAddress());
		return "/userLogin";
	}
	
	

	//for add and update User both
	@ModelAttribute("userCommand")
	public User newUser() {
		return new User();
	}
	
	@RequestMapping(value= "/user/add", method= RequestMethod.POST)
	public String addUser(@ModelAttribute("userCommand") User u, HttpServletRequest request, BindingResult result){
	
		try {
			if (result.hasErrors()) {
				return "/userLogin";
			}
			
			System.out.println(u.getBillingAddress().getCity());
			BillingAddress billingAddress= (BillingAddress) u.getBillingAddress();
			System.out.println(u.getBillingAddress().getCity());
			//System.out.println(billingAddress.getUser().getUser_name());
			//billingAddressService.addBillingAddress(billingAddress);
			//System.out.println(u.getUser_name());
			ShippingAddress shippingAddress = (ShippingAddress) u.getShippingAddress();
			//System.out.println(shippingAddress.getUser().getUser_name());
			//shippingAddressService.addShippingAddress(shippingAddress);
			
			u.setBillingAddress(billingAddress);
			u.setShippingAddress(shippingAddress);
			int user_id = u.getUser_id();	
			u.setUser_id(user_id);
			System.out.println(u.getUser_id());
			u.setEnabled(true);
			userService.addUser(u);
			
			MultipartFile userImage= u.getImage();
			String rootDirectory= request.getSession().getServletContext().getRealPath("/");
			path = Paths.get(rootDirectory + "WEB-INF/resources/images" + u.getUser_id() + ".png");
			System.out.println("Path = " + path);
			System.out.println("File name = " + u.getImage().getOriginalFilename());
			System.out.println(u.getUser_id());
			if(userImage!=null && !userImage.isEmpty())
			{
				try{
					userImage.transferTo(new File(path.toString()));
					System.out.println("Image Succesfully Uploaded");
				}
				catch(Exception e)
				{
					e.printStackTrace();
					System.out.println(e.getMessage());
					throw new RuntimeException("User Profile Picture Saving Failed", e);
				}
			}
			return "redirect:/register?user_id=" + u.getUser_id();
		
		} catch (Exception e) {
			return "nullPointer";										
		}
		
	}
	
	@RequestMapping(value = "/user/edit/{id}")
	public String editUser(@PathVariable("id") int id, Model model) {
		System.out.println("edit User");
		model.addAttribute("userCommand", this.userService.getUserById(id));
		model.addAttribute("userList", this.userService.getAllUsers());
		model.addAttribute("billingAddressList", this.billingAddressService.getAllBillingAddress());
		model.addAttribute("shippingAddressList", this.shippingAddressService.getAllShippingAddress());
		return "/userLogin" ;
	}
	
	@RequestMapping(value="/user/remove/{user_id}")
	public String deleteUser(@PathVariable("user_id") int user_id, Model model) throws Exception {
		try {
		User user =	(User) userService.getUserById(user_id);
		userService.deleteUser(user);
		System.out.println("Successfully deleted User");
		}
		catch(Exception e)
		{
		e.printStackTrace();
		model.addAttribute("message", e.getMessage());
		}
		return "redirect:/userLogin" ;
	}
	
	
}
