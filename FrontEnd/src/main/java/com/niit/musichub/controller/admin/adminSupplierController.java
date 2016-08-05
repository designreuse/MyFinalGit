package com.niit.musichub.controller.admin;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.musichub.Service.SupplierService;
import com.niit.musichub.model.Supplier;

@Controller
@RequestMapping("/admin/")
public class adminSupplierController {

	@Autowired
	SupplierService supplierService;
	
	private Path path;
	
	@RequestMapping(value= "/addSupplier", method= RequestMethod.GET)
	public ModelAndView list(){
		List<Supplier> list= supplierService.getAllSupplier();
		return new ModelAndView("addSupplier", "supplier", list);
	}
	
	@ModelAttribute("supplierCommand")
	public Supplier newSupplier(){
		return new Supplier();
	}
	
	@RequestMapping(value= "/supplier/add", method= RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplierCommand") Supplier s, HttpServletRequest request, BindingResult result){
		if(result.hasErrors()){
			return "/addSupplier" ;
		}
		System.out.println(s.getSupplier_id());
		supplierService.saveOrUpdate(s);
		
		MultipartFile supplierImage = s.getImage();
		  String rootDirectory= request.getSession().getServletContext().getRealPath("/");
		  path = Paths.get(rootDirectory + "/WEB-INF/resources/images" + s.getSupplier_id() + ".png"); 
		  System.out.println("Path = "+ path); 
		  System.out.println("File name = "+s.getImage().getOriginalFilename()); 
		  
		  if(supplierImage!= null && !supplierImage.isEmpty()) 
		  { 
		   try 
		   { 
		    supplierImage.transferTo(new File(path.toString())); 
		    System.out.println("Image uploaded"); 
		   }
		   catch(Exception ex) 
		   {
			   ex.printStackTrace();
		    System.out.println(ex.getMessage()); 
		    throw new RuntimeException("Supplier image saving failed", ex);
		   }
		   
		  }
		  return "redirect:/admin/addSupplier"; 
	}
	
	@RequestMapping("/supplier/remove/{id}")
	public String deleteCategory(@PathVariable("id") int supplier_id, ModelMap model) throws Exception {

		try {
			supplierService.deleteSupplier(supplier_id);
			model.addAttribute("message", "Successfully deleted");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		// redirectAttrs.addFlashAttribute(arg0, arg1)
		return "redirect:/admin/addSupplier";
	}
	
	@RequestMapping("supplier/edit/{id}")
	public String editProduct(@PathVariable("id") int supplier_id, Model model) {
		System.out.println("editSupplier");
		model.addAttribute("supplierCommand", this.supplierService.getSupplierById(supplier_id));
		model.addAttribute("listSupplier", this.supplierService.getAllSupplier());
		return "/addSupplier";
	}
	
}
