package com.niit.musichub.controller;


import com.niit.musichub.model.Product;

import javassist.bytecode.Descriptor.Iterator;

import com.niit.musichub.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;
    
    @Autowired
	private JavaMailSender mailSender;

    @RequestMapping("/ListProducts")
    public String getProducts(Model model){
        List<Product> products = productService.allProducts();
        model.addAttribute("products", products);

        return "ListProducts";
    }
    
    @RequestMapping("/ListProduct")
    public String getProductByCategory(@RequestParam("searchCondition") String searchCondition, Model model){
    	List<Product> productList = productService.allProducts();
    	List<Product> al= new ArrayList<Product>();
    	java.util.Iterator<Product> i= productList.iterator();
    	while(i.hasNext()){
    		Product p= i.next();
    		if(p.getCategory().getCategory_name().equals(searchCondition))
    			al.add(p);
    	}
    	model.addAttribute("products", al);
    	model.addAttribute("searchCondition", searchCondition);
    	
    	return "ListProducts" ;
    }
    
    @RequestMapping("/UserListProducts")
    public String gettProducts(Model model){
        List<Product> products = productService.allProducts();
        model.addAttribute("products", products);

        return "UserListProducts";
    }

    @RequestMapping("/viewProducts/{pid}")
    public String viewProduct(@PathVariable int pid, Model model) throws IOException{
        Product product = productService.get(pid);
        model.addAttribute("product", product);

        return "viewProducts";
    }

    /*@RequestMapping("/ListProducts")
    public String getProductByCategory(@RequestParam("searchCondition") String searchCondition, Model model){
        List<Product> products = productService.allProducts();
        model.addAttribute("products", products);
        model.addAttribute("searchCondition", searchCondition);

        return "ListProducts";
    }*/
    @RequestMapping("/favorite/{pid}")
    public String viewSendMailPage(@PathVariable int pid, Model model) throws IOException{
    	Product product = productService.get(pid);
        //model.addAttribute("product", product);
        model.addAttribute("subject", "My Favorite Product");
        String url= PageContext.REQUEST.toString();
        model.addAttribute("msg","Dear All,\n \n Greetings from CartPoint.com \n\nI liked this Product, Please click on below link to view the Product\n\n"+ url);

        return "sendMail";
    }
    
    @RequestMapping(value="/send", method=RequestMethod.POST)
    public String sendMail(HttpServletRequest request)
    {
    	try
		{
		String recipientAddress = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		// prints debug info
		System.out.println("To: " + recipientAddress);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + message);
		
		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(recipientAddress);
		email.setSubject(subject);
		email.setText(message);
		
		// sends the e-mail
		mailSender.send(email);
		
		
		}
		catch(Exception ex)
		{
			System.out.println("Exception = "+ex);
		}
		return "mailSent";
    }

} 
