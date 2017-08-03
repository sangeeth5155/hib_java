package com.sample.hibernate.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sample.hibernate.model.Products;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO dao=new UserDAO();
		Products p=new Products();
		Integer del=Integer.parseInt(request.getParameter("id1"));
		p=(Products)dao.findProductById(del);
		int delete=dao.deleteRecord(p);
		HttpSession session=request.getSession();
		session.setAttribute("removeproducts", p);
		RequestDispatcher rd=request.getRequestDispatcher("jsp/Products.jsp");
		rd.include(request, response);
		
	}
}