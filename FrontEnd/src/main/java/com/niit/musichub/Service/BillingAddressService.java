package com.niit.musichub.Service;

import java.util.List;

import com.niit.musichub.model.BillingAddress;

public interface BillingAddressService {

	void addBillingAddress(BillingAddress billingAddress);

    BillingAddress getBillingAddressById(int user_id);

    List<BillingAddress> getAllBillingAddress();

    BillingAddress getBillingAddressByUsername(String username);
    
    public void deleteBillingAddress(int user_id);
}
