package com.niit.musichub.DAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.musichub.DAO.ShippingAddressDAO;
import com.niit.musichub.model.Category;
import com.niit.musichub.model.ShippingAddress;
import com.niit.musichub.model.User;

@Repository
@Transactional
public class ShippingAddressDAOImpl implements ShippingAddressDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public ShippingAddressDAOImpl(){}
	public ShippingAddressDAOImpl(SessionFactory session){
		this.sessionFactory= sessionFactory;
	}
	public void addShippingAddress(ShippingAddress shippingAddress) {
		sessionFactory.getCurrentSession().saveOrUpdate(shippingAddress);
	}

	public ShippingAddress getShippingAddressById(int shippingAddressId) {
		Session session = sessionFactory.getCurrentSession();
        return (ShippingAddress) session.get(ShippingAddress.class, shippingAddressId);
	}

	public List<ShippingAddress> getAllShippingAddress() {
	
		@SuppressWarnings("unchecked")
		List<ShippingAddress> listShippingAddress = (List<ShippingAddress>) sessionFactory.getCurrentSession().createQuery("from ShippingAddress").list();
		return listShippingAddress;
	}

	public ShippingAddress getShippingAddressByUsername(String username) {
		String hql="from ShippingAddress where user.user_name = ?";
		Query query= sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, username);
		@SuppressWarnings("unchecked")
		List<ShippingAddress> listShippingAddress = (List<ShippingAddress>) query.list();
		if (listShippingAddress != null && !listShippingAddress.isEmpty()){
			return listShippingAddress.get(0);
		}
		else {
			return null;
		}	}
	public void deleteShippingAddress(int user_id) {
		Session session = sessionFactory.getCurrentSession();
        ShippingAddress shippingAddress = (ShippingAddress)  session.get(ShippingAddress.class, user_id);
		sessionFactory.getCurrentSession().delete(shippingAddress);
		
	}

}
