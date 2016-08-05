package com.niit.musichub.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.musichub.DAO.BillingAddressDAO;
import com.niit.musichub.Service.BillingAddressService;
import com.niit.musichub.model.BillingAddress;

@Service
public class BillingAddressServiceImpl implements BillingAddressService{

	@Autowired
	private BillingAddressDAO billingAddressDAO;

	public void addBillingAddress(BillingAddress billingAddress) {
		billingAddressDAO.addBillingAddress(billingAddress);
	}

	public BillingAddress getBillingAddressById(int user_id) {
		return billingAddressDAO.getBillingAddressById(user_id);
	}

	public List<BillingAddress> getAllBillingAddress() {
		return billingAddressDAO.getAllBillingAddress();
	}

	public BillingAddress getBillingAddressByUsername(String username) {
		return billingAddressDAO.getBillingAddressByUsername(username);
	}

	public void deleteBillingAddress(int user_id) {
		billingAddressDAO.deleteBillingAddress(user_id);
		
	}
	
	
	
}
