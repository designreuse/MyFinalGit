package com.niit.musichub.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.musichub.DAO.CategoryDAO;
import com.niit.musichub.Service.CategoryService;
import com.niit.musichub.model.Category;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDAO categoryDAO;

	public void addCategory(Category category) {
		categoryDAO.addCategory(category);
	}

	public void saveOrUpdate(Category category) {
		categoryDAO.saveOrUpdate(category);
	}

	public Category getCategoryById(int category_id) {
		return categoryDAO.getCategoryById(category_id);
	}

	public List<Category> getAllCategory() {
		return categoryDAO.getAllCategory();
	}

	public Category getCategoryByCategoryName(String Category_name) {
		return categoryDAO.getCategoryByCategoryName(Category_name);
	}

	public void deleteCategory(int category_id) {
		categoryDAO.deleteCategory(category_id);
	}
	
	
}
