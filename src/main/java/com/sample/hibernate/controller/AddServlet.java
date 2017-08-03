package com.sample.hibernate.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sample.hibernate.model.Categories;
import com.sample.hibernate.model.Products;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 UserDAO dao=new UserDAO();
		 Products p=new Products();
		 //p.setId(Integer.parseInt(request.getParameter("product_id")));
		 p.setName(request.getParameter("product_name"));
		 p.setPrice(Double.parseDouble(request.getParameter("product_price")));
		 p.setQuantity(request.getParameter("quantity"));
		 Categories c=new Categories();
	     c.setCname(request.getParameter("category"));
		 c.setCid(Integer.parseInt(request.getParameter("category")));
		 p.setCategory(c);
		 HttpSession session=request.getSession();
		 session.setAttribute("newproducts", p);
		int  confirmAdd=dao.insertRecord(p);
		if(confirmAdd>0) {
			RequestDispatcher rd=request.getRequestDispatcher("jsp/Products.jsp");
			rd.include(request, response);
		}
	}
}