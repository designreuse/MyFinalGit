package com.niit.musichub.DAO;

import java.util.List;

import com.niit.musichub.model.Supplier;

public interface SupplierDAO {

public void addSupplier(Supplier supplier);
	
	public void saveOrUpdate(Supplier supplier);

    Supplier getSupplierById(int supplier_id);

    List<Supplier> getAllSupplier();

    Supplier getSupplierBySupplierName(String supplier_name);
    
    public void deleteSupplier(int supplier_id);
    
}
