package com.niit.musichub.DAO;


import com.niit.musichub.model.Cart;

import java.io.IOException;

public interface CartDAO {

    Cart getCartById(int cartId);

    Cart validate(int cartId) throws IOException;

    void update(Cart cart);

}

