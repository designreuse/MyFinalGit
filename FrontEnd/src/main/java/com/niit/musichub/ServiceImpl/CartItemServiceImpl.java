package com.niit.musichub.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.musichub.DAO.CartItemDAO;
import com.niit.musichub.Service.CartItemService;
import com.niit.musichub.model.Cart;
import com.niit.musichub.model.CartItem;

@Service
public class CartItemServiceImpl implements CartItemService{

    @Autowired
    private CartItemDAO cartItemDAO;

    public void addCartItem(CartItem cartItem){
        cartItemDAO.addCartItem(cartItem);
    }

    public void removeCartItem(CartItem cartItem){
        cartItemDAO.removeCartItem(cartItem);
    }

    public void removeAllCartItems(Cart cart){
        cartItemDAO.removeAllCartItems(cart);
    }

    public CartItem getCartItemByProductId(int productId){
        return cartItemDAO.getCartItemByProductId(productId);
    }

} 
