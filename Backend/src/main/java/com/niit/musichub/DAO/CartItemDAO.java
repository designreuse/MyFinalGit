package com.niit.musichub.DAO;

import com.niit.musichub.model.Cart;
import com.niit.musichub.model.CartItem;

public interface CartItemDAO {

    void addCartItem(CartItem cartItem);

    void removeCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);

    CartItem getCartItemByProductId(int productId);

}
