package com.niit.musichub.DAOImpl;

import java.io.IOException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.musichub.DAO.UserDAO;
import com.niit.musichub.model.Authorities;
import com.niit.musichub.model.BillingAddress;
import com.niit.musichub.model.Cart;
import com.niit.musichub.model.CartItem;
import com.niit.musichub.model.ShippingAddress;
import com.niit.musichub.model.User;
import com.niit.musichub.model.Users;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	
	public UserDAOImpl(){
		
	}
	
	@Autowired
	private SessionFactory sessionFactory;

	public UserDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	public void addUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		
		user.getBillingAddress().setUser(user);
		user.getShippingAddress().setUser(user);
		
		session.saveOrUpdate(user);
        session.saveOrUpdate(user.getBillingAddress());
        session.saveOrUpdate(user.getShippingAddress());

        Users newUser = new Users();
        newUser.setUsersId(user.getUser_id());
        newUser.setUsername(user.getUser_name());
        newUser.setPassword(user.getPassword());
        newUser.setEnabled(true);
        newUser.setCustomer_id(user.getUser_id());
		
        Authorities newAuthorities = new Authorities();
        newAuthorities.setUsername(user.getUser_name());
        newAuthorities.setAuthority("ROLE_USER");
        
        session.saveOrUpdate(newUser);
        session.saveOrUpdate(newAuthorities);

        Cart newCart = new Cart();
        newCart.setUser(user);
        user.setCart(newCart);

        session.saveOrUpdate(user);
        session.saveOrUpdate(newCart);

        session.flush();

	}

	public User getUserById(int user_id) {
		Session session = sessionFactory.getCurrentSession();
        return (User) session.get(User.class, user_id);

	}

	public List<User> getAllUsers() {
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) sessionFactory.getCurrentSession().createQuery("from User").list();
		return listUser;
	}

	public User getUserByUsername(String user_name) {
		System.out.println("hello");
		String hql="from User where user_name=:unm";
		Query query =  sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("unm" , user_name);
		@SuppressWarnings("unchecked")
		List<User> listUser= (List<User>) query.list();
		System.out.println("hello");
		if (listUser != null && !listUser.isEmpty()) {
			
			return listUser.get(0);
			
		}
		else
		{
			return null;			
		}

	}

	public void saveOrUpdate(User user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
		
	}

	public void deleteUser(User user) { 
		Cart cart = user.getCart();
		BillingAddress billingAddress = user.getBillingAddress();
		ShippingAddress shippingAddress = user.getShippingAddress();
		//List<CartItem> cartItems = cart.getCartItems(); 
		sessionFactory.getCurrentSession().delete(shippingAddress);
		sessionFactory.getCurrentSession().delete(billingAddress);
		/*if(cartItems != null)
		{sessionFactory.getCurrentSession().delete(cartItems);}*/
		sessionFactory.getCurrentSession().delete(cart);
        sessionFactory.getCurrentSession().delete(user);		
	}
	
	public User validate(int user_id) throws IOException{
    	System.out.println(user_id);
        User user = getUserById(user_id);
        System.out.println(user_id);
        if(user == null){
            throw new IOException(user_id + "");
        }

        saveOrUpdate(user);
        return user;
    }

}
