package com.niit.musichub.Service;

import java.util.List;

import com.niit.musichub.model.Product;

public interface ProductService {


	public List<Product> allProducts();
	
	public Product get(int pid);
	
	public void saveOrUpdate11(Product product);
	
	public void delete(int pid);
}
