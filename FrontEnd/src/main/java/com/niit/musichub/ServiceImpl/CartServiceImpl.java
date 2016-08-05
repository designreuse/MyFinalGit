package com.niit.musichub.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.musichub.DAO.CartDAO;
import com.niit.musichub.Service.CartService;
import com.niit.musichub.model.Cart;


@Service
public class CartServiceImpl implements CartService{

    @Autowired
    private CartDAO cartDAO;

    public Cart getCartById(int cartId){
        return cartDAO.getCartById(cartId);
    }

    public void update(Cart cart){
        cartDAO.update(cart);
    }

} 
