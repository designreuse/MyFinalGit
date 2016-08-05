package com.niit.musichub.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.musichub.DAO.ProductDAO;
import com.niit.musichub.Service.ProductService;
import com.niit.musichub.model.Product;


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	public List<Product> allProducts() {
		return productDAO.allProducts();
	}

	public Product get(int pid) {
		return productDAO.get(pid);
	}

	public void saveOrUpdate11(Product product) {
		productDAO.saveOrUpdate11(product);
	}

	public void delete(int pid) {
		productDAO.delete(pid);
	}
}