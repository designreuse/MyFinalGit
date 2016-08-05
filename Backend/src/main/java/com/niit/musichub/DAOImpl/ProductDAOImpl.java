package com.niit.musichub.DAOImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.niit.musichub.DAO.ProductDAO;
import com.niit.musichub.model.Product;
import com.niit.musichub.model.Supplier;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO {

	public ProductDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	@Autowired
	private SessionFactory sessionFactory;

	public ProductDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;

	}
	
	
	public List<Product> allProducts() {
		@SuppressWarnings("unchecked")
		List<Product> listProduct  = (List<Product>) sessionFactory.getCurrentSession().createQuery("from Product").list();
		return listProduct;
	}

	
	public void saveOrUpdate11(Product product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	}

	
	public void delete(int id) {
		Product ProductToDelete = new Product();
		ProductToDelete.setPid(id);
		sessionFactory.getCurrentSession().delete(ProductToDelete);
	}

	
	public Product get(int pid) {
		Session session = sessionFactory.getCurrentSession();
        Product product = (Product)  session.get(Product.class, pid);
        return product;
		/*String hql = "from Product where pid=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, pid);
		@SuppressWarnings("unchecked")
		List<Product> listProduct = (List<Product>) query.list();
		if (listProduct != null && !listProduct.isEmpty()) {
			return listProduct.get(0);
		}
		else
		{
			return null;			
		}*/

	}



}
