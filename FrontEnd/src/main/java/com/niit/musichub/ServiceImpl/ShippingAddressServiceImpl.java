package com.niit.musichub.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.musichub.DAO.ShippingAddressDAO;
import com.niit.musichub.Service.ShippingAddressService;
import com.niit.musichub.model.ShippingAddress;

@Service
public class ShippingAddressServiceImpl implements ShippingAddressService {

	@Autowired
	private ShippingAddressDAO shippingAddressDAO;

	public void addShippingAddress(ShippingAddress shippingAddress) {
		shippingAddressDAO.addShippingAddress(shippingAddress);
	}

	public ShippingAddress getShippingAddressById(int user_id) {
		return shippingAddressDAO.getShippingAddressById(user_id);
	}

	public List<ShippingAddress> getAllShippingAddress() {
		return shippingAddressDAO.getAllShippingAddress();
	}

	public ShippingAddress getShippingAddressByUsername(String username) {
		return shippingAddressDAO.getShippingAddressByUsername(username);
	}

	public void deleteShippingAddress(int user_id) {
		shippingAddressDAO.deleteShippingAddress(user_id);
	}
	
}
