package com.sample.hibernate.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.sample.hibernate.model.Categories;
import com.sample.hibernate.model.Products;
import com.sample.hibernate.model.Employees;
import com.sample.hibernate.util.HibernateUtil;

public class UserDAO {
	
	public Transaction tx=null;
	public Session session=null;
	SessionFactory sf=null;
	
	public UserDAO() {
	sf = HibernateUtil.getSessionFactory();
    session = sf.openSession();
   
	}
    
    public Integer insertRecord(Object o) {
    	int status=1;
    	sf = HibernateUtil.getSessionFactory();
        session = sf.openSession();
        session.beginTransaction();
    	session.persist((Products)o);
    	System.out.print("hai"+status);
    	session.getTransaction().commit();
    	session.flush();
    	return status;
    }
    
    public Integer updateRecord(int id,Object o) {
    	int status=1;
    	sf = HibernateUtil.getSessionFactory();
        session = sf.openSession();
        session.beginTransaction();
        Products products=
        		 (Products)session.get(Products.class, id);
        Products edit=(Products)o;
        System.out.print(edit.getId()+" "+products.getId());
        products.setName(edit.getName());
        System.out.print(edit.getName()+" "+products.getName());
        products.setPrice(edit.getPrice());
        System.out.print(edit.getPrice()+" "+products.getPrice());
        products.setQuantity(edit.getQuantity());
        System.out.print(edit.getQuantity()+" "+products.getQuantity());
        products.setCategory(edit.getCategory());
        System.out.print(edit.getCategory()+" "+products.getCategory());
        session.saveOrUpdate(products);
    	System.out.print("hai"+status);
    	session.getTransaction().commit();
    	session.flush();
    	return status;
    }
    
    public Integer deleteRecord(Object o) {
    	int status=1;
    	sf = HibernateUtil.getSessionFactory();
        session = sf.openSession();
        session.beginTransaction();
    	session.delete((Products)o);
    	System.out.print("hai"+status);
    	session.getTransaction().commit();
    	session.flush();
    	return status;
    }
    
    public Employees getEmployeeDetails(int id1) {
    	Employees result=new Employees();
    	Query q = null;
    	try {
    	sf = HibernateUtil.getSessionFactory();
    	session = sf.openSession();
     	/*tx = session.getTransaction();
     	
    	tx.begin();*/
    	tx = session.beginTransaction();
    	q = session.createQuery("from Employees where id='"+id1+"'");
    	result=(Employees)q.uniqueResult();
    	
 		System.out.println(result.getEmail()+" "+result.getFirstname());
 		
    	tx.commit();
    	}  
    	catch (Exception e) {
    	   if (tx != null)
    	   {
    		tx.rollback();
    		}
    		e.printStackTrace();
    		} finally {
    		
    		}
    	   
    		return result;
    	}
    
    
    public List getProductDetails() {
    	List products = null;
    	Query q = null;
    	try {
    	sf = HibernateUtil.getSessionFactory();
    	session = sf.openSession();
    	tx = session.getTransaction();
    	tx.begin();
    	products = session.createQuery("FROM Products").list(); 
        for (Iterator iterator1 = products.iterator(); iterator1.hasNext();){
           Products prod = (Products) iterator1.next(); 
           System.out.print("Name: " + prod.getName()); 
           System.out.print(" Price: " + prod.getPrice()); 
           //System.out.println("  Salary: " + employee.getSalary());
           Categories cName = prod.getCategory(); 
           System.out.println("Category: " + cName.getCname()); 
          
        }
        tx.commit();
    	}  catch (Exception e) {
    	   if (tx != null) {
    		tx.rollback();
    		}
    		e.printStackTrace();
    		} finally {
    		
    		}
    	
    	return products;
    }
    public Products findProductById(int id) {
    	
    		Products result=new Products();
        	Query q = null;
        	try {
        	sf = HibernateUtil.getSessionFactory();
        	session = sf.openSession();
         	tx = session.getTransaction();
        	tx.begin();
        	q = session.createQuery("from Products where id='"+id+"'");
        	result=(Products)q.uniqueResult();
        	
     		//System.out.println(result.getEmail()+" "+result.getFirstname());
        	tx.commit();
        	}  catch (Exception e) {
        	   if (tx != null) {
        		tx.rollback();
        		}
        		e.printStackTrace();
        		} finally {
        		
        		}
        	   
        		
    	
		return result;
    }
    public List getCategoryDetails() {
    	List category = null;
    	Query q = null;
    	try {
    	sf = HibernateUtil.getSessionFactory();
    	session = sf.openSession();
    	tx = session.getTransaction();
    	tx.begin();
    	category = session.createQuery("FROM Categories").list(); 
        tx.commit();
    	}  catch (Exception e) {
    	   if (tx != null) {
    		tx.rollback();
    		}
    		e.printStackTrace();
    		} finally {
    		
    		}
    	
    	return category;
    }
   
}