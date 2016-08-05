package com.niit.musichub.Service;

import java.util.List;

import com.niit.musichub.model.Category;

public interface CategoryService {

void addCategory(Category category);
	
	public void saveOrUpdate(Category category);

    Category getCategoryById(int category_id);

    List<Category> getAllCategory();

    Category getCategoryByCategoryName(String Category_name);
    
    public void deleteCategory(int category_id);
}
