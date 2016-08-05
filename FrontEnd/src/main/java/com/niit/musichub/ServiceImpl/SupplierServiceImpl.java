package com.niit.musichub.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.musichub.DAO.ProductDAO;
import com.niit.musichub.DAO.SupplierDAO;
import com.niit.musichub.Service.SupplierService;
import com.niit.musichub.model.Supplier;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierDAO supplierDAO;
	
	public void saveOrUpdate(Supplier supplier) {
		supplierDAO.saveOrUpdate(supplier);
	}

	public Supplier getSupplierById(int supplier_id) {
		return supplierDAO.getSupplierById(supplier_id);
	}

	public List<Supplier> getAllSupplier() {
		return supplierDAO.getAllSupplier();
	}

	public Supplier getSupplierBySupplierName(String supplier_name) {
		return supplierDAO.getSupplierBySupplierName(supplier_name);
	}

	public void deleteSupplier(int supplier_id) {
		supplierDAO.deleteSupplier(supplier_id);
	}

}
