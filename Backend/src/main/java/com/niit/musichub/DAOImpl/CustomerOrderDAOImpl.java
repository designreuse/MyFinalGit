package com.niit.musichub.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.musichub.DAO.CartDAO;
import com.niit.musichub.DAO.CustomerOrderDAO;
import com.niit.musichub.model.Cart;
import com.niit.musichub.model.CartItem;
import com.niit.musichub.model.CustomerOrder;

@Repository
@Transactional
public class CustomerOrderDAOImpl implements CustomerOrderDAO{

	    @Autowired
	    private SessionFactory sessionFactory;
	    
	    @Autowired
	    private CartDAO cartDAO;
	    
	    public void addCustomerOrder(CustomerOrder customerOrder){
	        Session session = sessionFactory.getCurrentSession();
	        session.saveOrUpdate(customerOrder);
	        session.flush();
	    }

		public double getCustomerOrderGrandTotal(int cartId) {
			double grandTotal = 0;
	        Cart cart = cartDAO.getCartById(cartId);
	        List<CartItem> cartItems = cart.getCartItems();

	        for (CartItem item : cartItems){
	            grandTotal += item.getTotalPrice();
	        }

	        return grandTotal;
		}


	}


