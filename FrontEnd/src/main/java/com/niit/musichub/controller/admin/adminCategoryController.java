package com.niit.musichub.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.musichub.Service.CategoryService;
import com.niit.musichub.model.Category;
import com.niit.musichub.model.Supplier;

@Controller
@RequestMapping("/admin/")
public class adminCategoryController {

	

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value= "/addCategory", method= RequestMethod.GET)
	public ModelAndView list(){
		List<Category> list= categoryService.getAllCategory();
		return new ModelAndView("addCategory", "category", list);
	}
	
	@ModelAttribute("categoryCommand")
	public Category newCategory(){
		return new Category();
	}
	
	@RequestMapping(value= "/category/add", method= RequestMethod.POST)
	public String addCategory(@ModelAttribute("categoryCommand") Category c, BindingResult result){
		if(result.hasErrors()){
			return "/addCategory";
		}
		
		System.out.println( c.getCategory_id());
		categoryService.saveOrUpdate(c);
		return "redirect:/admin/addCategory";
		
	}
	
	@RequestMapping("/category/remove/{id}")
	public String deleteCategory(@PathVariable("id") int category_id, ModelMap model) throws Exception {

		try {
			categoryService.deleteCategory(category_id);
			model.addAttribute("message", "Successfully deleted");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		// redirectAttrs.addFlashAttribute(arg0, arg1)
		return "redirect:/admin/addCategory";
	}
	
	@RequestMapping("category/edit/{id}")
	public String editProduct(@PathVariable("id") int category_id, Model model) {
		System.out.println("editCategory");
		model.addAttribute("categoryCommand", this.categoryService.getCategoryById(category_id));
		model.addAttribute("listCategory", this.categoryService.getAllCategory());
		return "/addCategory";
	}

}
