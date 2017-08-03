package com.sample.hibernate.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sample.hibernate.model.Categories;
import com.sample.hibernate.model.Employees;
import com.sample.hibernate.model.Products;

@WebServlet("/FetchServlet")
public class FetchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   UserDAO dao=new UserDAO();
	   int id=Integer.parseInt(request.getParameter("emp"));
	   Employees e1=dao.getEmployeeDetails(Integer.parseInt(request.getParameter("emp")));
	  
       if(e1.getId()==id) {
    	  List p=dao.getProductDetails();
    	  HttpSession session= request.getSession();
		  session.setAttribute("currentemployee", e1);
		  session.setAttribute("products", p);
		  RequestDispatcher rd=request.getRequestDispatcher("jsp/Products.jsp");
 		  rd.include(request, response);
		  
	  } else {
		  
		  RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		  rd.include(request, response);
		  
	  }
	   

	}
}