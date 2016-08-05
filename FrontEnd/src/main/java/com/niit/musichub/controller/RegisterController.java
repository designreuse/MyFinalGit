package com.niit.musichub.controller;

import com.niit.musichub.Service.UserService;
import com.niit.musichub.model.BillingAddress;
import com.niit.musichub.model.ShippingAddress;
import com.niit.musichub.model.User;

import javax.enterprise.inject.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;
    
	/*@RequestMapping("/collectUserInfo")
	public String registerUser(@ModelAttribute("registerCommand") User user, BindingResult result){
		if (result.hasErrors()) {
			return "/collectUserInfo";
		}
		
		return "redirect:/collectUserInfo";
		
	}*/

    @RequestMapping("/registerStar/{user_id}")
    public String createUser(@PathVariable("user_id") int user_id){
    	
    	User user=new User();
    	user.setUser_id(user_id);
    	BillingAddress billingAddress = new BillingAddress();
    	ShippingAddress shippingAddress = new ShippingAddress();
    	user.setBillingAddress(billingAddress);
    	user.setShippingAddress(shippingAddress);
    	//userService.addUser(user);
    	
        return "redirect:/register?user_id=" + user_id ;

    }

} 
