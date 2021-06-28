package com.suza.controllers;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.suza.db.EmployeeDb;
import com.suza.model.Employee;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
  	  	PrintWriter out=response.getWriter();

	String username = request.getParameter("username");
	String password = request.getParameter("password");

	EmployeeDb edb=new EmployeeDb();
	try {
		Employee emp=edb.checkLogin(username, password);
		 request.getRequestDispatcher("login.jsp").include(request, response);
		 
		if(emp !=null) {
			HttpSession session =request.getSession();
			session.setAttribute("fname", emp.getFirstName());
			session.setAttribute("lname", emp.getLastName());
			session.setAttribute("roll", emp.getRoll());
			session.setAttribute("id_no", emp.getId());
			
			String myRoll =(String)session.getAttribute("roll");
			
			if(myRoll.equals("admin")) {
				response.sendRedirect("views/admin/index.jsp");
				
			}else if(myRoll.equals("dataentry")) {
				response.sendRedirect("views/dataentry/index.jsp");
				
			}else {
				response.sendRedirect("views/staff/index.jsp");
			}
			
			}else {
				out.println("<p align='center' colour='blue'>Invalid username or password</p>");
			}
		
		
			}catch(SQLException e){	
				System.out.print(e);
			}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
