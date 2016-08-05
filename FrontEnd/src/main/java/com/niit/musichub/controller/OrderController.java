package com.niit.musichub.controller;

import com.niit.musichub.Service.CartService;
import com.niit.musichub.Service.CustomerOrderService;
import com.niit.musichub.model.Cart;
import com.niit.musichub.model.CustomerOrder;
import com.niit.musichub.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

    @Autowired
    private CartService cartService;

    @Autowired
    private CustomerOrderService customerOrderService;

    @RequestMapping("/order/{cartId}")
    public String createOrder(@PathVariable("cartId") int cartId){
        CustomerOrder customerOrder = new CustomerOrder();
        Cart cart = cartService.getCartById(cartId);
        customerOrder.setCart(cart);

        User user = cart.getUser();
        customerOrder.setUser(user);
        customerOrder.setBillingAddress(user.getBillingAddress());
        user.setShippingAddress(user.getShippingAddress());

        customerOrderService.addCustomerOrder(customerOrder);

        return "redirect:/checkout?cartId=" + cartId;

    }

} // The End of Class;
