package com.sample.hibernate.controller;


import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import javax.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sample.hibernate.model.Products;

import java.sql.*;
/**
 * Servlet implementation class FetchServlet
 */
@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet
	(HttpServletRequest request,HttpServletResponse response)throws ServletException,java.io.IOException
	{
		try {
		int ic=Integer.parseInt(request.getParameter("id1"));
		UserDAO dao=new UserDAO();
		Products p=dao.findProductById(ic);
		HttpSession session=request.getSession();
	    session.setAttribute("product", p);
			//response.sendRedirect("Products.jsp");
        RequestDispatcher rd=request.getRequestDispatcher("/jsp/viewProducts.jsp");
        rd.include(request,response);

		
		} catch(Exception e) {
			System.out.println(e.getMessage());
	}
	}
}