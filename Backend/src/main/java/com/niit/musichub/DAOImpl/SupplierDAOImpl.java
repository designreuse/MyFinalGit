package com.niit.musichub.DAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.musichub.DAO.SupplierDAO;
import com.niit.musichub.model.Category;
import com.niit.musichub.model.Supplier;
import com.niit.musichub.model.User;

@Repository
@Transactional
public class SupplierDAOImpl implements SupplierDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public SupplierDAOImpl(){}
	public SupplierDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	public void addSupplier(Supplier supplier) {
		sessionFactory.getCurrentSession().saveOrUpdate(supplier);
	}

	public void saveOrUpdate(Supplier supplier) {
		sessionFactory.getCurrentSession().saveOrUpdate(supplier);	
	}

	public Supplier getSupplierById(int supplier_id) {
		Session session = sessionFactory.getCurrentSession();
        return (Supplier) session.get(Supplier.class, supplier_id);
	}

	public List<Supplier> getAllSupplier() {
		@SuppressWarnings("unchecked")
		List<Supplier> listSupplier = (List<Supplier>) sessionFactory.getCurrentSession().createQuery("from Supplier").list();
		return listSupplier;	
	}

	public Supplier getSupplierBySupplierName(String supplier_name) {
		String hql = "from Supplier where supplier_name = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, supplier_name);
		@SuppressWarnings("unchecked")
		List<Supplier> listSupplier = (List<Supplier>) query.list();
		if (listSupplier != null && !listSupplier.isEmpty())
		{
			return listSupplier.get(0);
		}
		else
		{
			return null;
		}
	}
	public void deleteSupplier(int supplier_id) {
		Session session = sessionFactory.getCurrentSession();
        Supplier supplier = (Supplier)  session.get(Supplier.class, supplier_id);
        session.delete(supplier);
	}

}
