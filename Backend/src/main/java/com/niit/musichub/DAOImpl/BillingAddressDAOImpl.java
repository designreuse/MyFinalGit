package com.niit.musichub.DAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.musichub.DAO.BillingAddressDAO;
import com.niit.musichub.model.BillingAddress;
import com.niit.musichub.model.Category;
import com.niit.musichub.model.User;

@Repository
@Transactional
public class BillingAddressDAOImpl implements BillingAddressDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public BillingAddressDAOImpl(){}
	
	public BillingAddressDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory= sessionFactory;
	}
	
	public void addBillingAddress(BillingAddress billingAddress) {
		sessionFactory.getCurrentSession().saveOrUpdate(billingAddress);
	}

	public BillingAddress getBillingAddressById(int billingAddressId) {
		Session session = sessionFactory.getCurrentSession();
        return (BillingAddress) session.get(BillingAddress.class, billingAddressId);
	}

	public List<BillingAddress> getAllBillingAddress() {
		@SuppressWarnings("unchecked")
		List<BillingAddress> listBillingAddress = (List<BillingAddress>) sessionFactory.getCurrentSession().createQuery("from BillingAddress").list();
		return listBillingAddress;
	}

	public BillingAddress getBillingAddressByUsername(String username) {
		String hql="from BillingAddress where user.user_name = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,username);
		@SuppressWarnings("unchecked")
		List<BillingAddress> listBillingAddress = (List<BillingAddress>) query.list();
		if(listBillingAddress != null && !listBillingAddress.isEmpty()){
			return listBillingAddress.get(0);
		}
		else {
			return null;
		}	
	}

	public void deleteBillingAddress(int user_id) {
		Session session = sessionFactory.getCurrentSession();
		BillingAddress billingAddress = (BillingAddress)  session.get(BillingAddress.class, user_id);
		sessionFactory.getCurrentSession().delete(billingAddress);
	}

}
