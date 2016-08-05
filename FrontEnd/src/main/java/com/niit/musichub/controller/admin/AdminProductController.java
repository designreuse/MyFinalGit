package com.niit.musichub.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/* import javax.servlet.http.HttpServletRequest;*/

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.niit.musichub.Service.CategoryService;
import com.niit.musichub.Service.ProductService;
import com.niit.musichub.Service.SupplierService;
import com.niit.musichub.model.Category;
import com.niit.musichub.model.Product;
import com.niit.musichub.model.Supplier;

@Controller
@RequestMapping("/admin/")
public class AdminProductController {

	
	@Autowired
	ProductService pdi;
	
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private SupplierService supplierService;

	private Path path; 
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String listProducts(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("category", new Category());
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("productList", this.pdi.allProducts());
		model.addAttribute("categoryList", this.categoryService.getAllCategory());
		model.addAttribute("supplierList", this.supplierService.getAllSupplier());
		return "/addProduct";
	}
	
	// For add and update product both
	@ModelAttribute("productcommand")
	public Product newProduct() {
		return new Product();
	}
	

	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("productcommand") Product p, HttpServletRequest request, BindingResult result) {
		if (result.hasErrors()) {
			return "/addProduct";
		}
		
		Category category = categoryService.getCategoryByCategoryName(p.getCategory().getCategory_name());
		System.out.println(p.getCategory().getCategory_name());
		//categoryService.saveOrUpdate(p.getCategory());
		System.out.println(p.getSupplier().getSupplier_name());
		Supplier supplier = supplierService.getSupplierBySupplierName(p.getSupplier().getSupplier_name());
		
		p.setCategory(category);
		p.setSupplier(supplier);
		
		System.out.println(p.getPid());
		pdi.saveOrUpdate11(p);
		
		
		System.out.println("trying");
		
		  MultipartFile productImage = p.getImage();
		  String rootDirectory= request.getSession().getServletContext().getRealPath("/");
		  path = Paths.get(rootDirectory + "/WEB-INF/resources/images" + p.getPid() + ".png"); 
		  System.out.println("Path = "+ path); 
		  System.out.println("File name = "+p.getImage().getOriginalFilename()); 
		  
		  //File f=new File(path); 
		  
		  if(productImage!= null && !productImage.isEmpty()) 
		  { 
		   try 
		   { 
		    productImage.transferTo(new File(path.toString())); 
		    System.out.println("Image uploaded"); 
		   }
		   catch(Exception ex) 
		   {
			   ex.printStackTrace();
		    System.out.println(ex.getMessage()); 
		    throw new RuntimeException("Product image saving failed", ex);
		   }
		   
		  }
		  return "redirect:/admin/addProduct"; 
	}

	@RequestMapping("/product/remove/{id}")
	public String deleteCategory(@PathVariable("id") int id, ModelMap model) throws Exception {

		try {
			pdi.delete(id);
			model.addAttribute("message", "Successfully deleted");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		// redirectAttrs.addFlashAttribute(arg0, arg1)
		return "redirect:/admin/addProduct";
	}

	@RequestMapping("product/edit/{id}")
	public String editProduct(@PathVariable("id") int id, Model model) {
		System.out.println("editProduct");
		model.addAttribute("productcommand", this.pdi.get(id));
		model.addAttribute("productList", this.pdi.allProducts());
		model.addAttribute("categoryList", this.categoryService.getAllCategory());
		model.addAttribute("supplierList", this.supplierService.getAllSupplier());
		return "/addProduct";
	}

}
