package com.niit.musichub.DAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.musichub.DAO.CategoryDAO;
import com.niit.musichub.model.Category;
import com.niit.musichub.model.Supplier;

@Repository
@Transactional
public class CategoryDAOImpl implements CategoryDAO{

	public CategoryDAOImpl(){}
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public CategoryDAOImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	public void addCategory(Category category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
	}

	public void saveOrUpdate(Category category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
	}

	public Category getCategoryById(int category_id) {
		Session session = sessionFactory.getCurrentSession();
        return (Category) session.get(Category.class, category_id);
	}

	public List<Category> getAllCategory() {
		@SuppressWarnings("unchecked")
		List<Category> categoryList = sessionFactory.getCurrentSession().createQuery("from Category").list();
		return categoryList;
	}

	public Category getCategoryByCategoryName(String category_name) {
		String hql= "from Category where category_name = ?" ;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, category_name);
		@SuppressWarnings("unchecked")
		List<Category> categoryList = (List<Category>) query.list();
		if ( categoryList != null && !categoryList.isEmpty())
		{
			return categoryList.get(0);
		}
		else
		{
			return null;
		}
	}

	public void deleteCategory(int category_id) {
		Session session = sessionFactory.getCurrentSession();
        Category category = (Category)  session.get(Category.class, category_id);
		sessionFactory.getCurrentSession().delete(category);		
	}

}
