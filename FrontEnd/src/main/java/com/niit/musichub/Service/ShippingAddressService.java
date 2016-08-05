package com.niit.musichub.Service;

import java.util.List;

import com.niit.musichub.model.ShippingAddress;

public interface ShippingAddressService {

	void addShippingAddress(ShippingAddress shippingAddress);

    ShippingAddress getShippingAddressById(int user_id);

    List<ShippingAddress> getAllShippingAddress();

    ShippingAddress getShippingAddressByUsername(String username);
    
    public void deleteShippingAddress(int user_id);
}
