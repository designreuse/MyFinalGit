package com.niit.musichub.Service;

import com.niit.musichub.model.*;

public interface CartService {

    Cart getCartById(int cartId);

    void update(Cart cart);
}
