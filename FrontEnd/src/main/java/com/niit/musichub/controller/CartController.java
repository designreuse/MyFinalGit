package com.niit.musichub.controller;

import com.niit.musichub.model.User;
import com.niit.musichub.Service.UserService;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
//import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Cart")
public class CartController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public String getCart(Principal p){
        try {
			User user = userService.getUserByUsername(p.getName());
			int cartId = user.getCart().getCartId();
			return "redirect:/Cart/" + cartId;
		} catch (Exception e) {
			return "nullPointerCart";
		}
    }

    @RequestMapping("/{cartId}")
    public String getCartRedirect(@PathVariable (value = "cartId") int cartId, Model model){
        model.addAttribute("cartId", cartId);

        return "Cart" ;
    }

} // The End of Class;
