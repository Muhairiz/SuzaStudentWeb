package com.suza.controllers;

import java.io.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
    
    public static String getMd5(String input) {
        try {
  
            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
  
            // digest() method is called to calculate message digest
            //  of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());
  
            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);
  
            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } 
  
        // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	response.setContentType("text/html");
	String username = request.getParameter("username");
	String pass = request.getParameter("pass");
	
	String password = getMd5(pass);
	

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
				
			}else if(myRoll.equals("data entry")) {
				response.sendRedirect("views/dataentry/index.jsp");
				
			}else {
				response.sendRedirect("views/staff/index.jsp");
			}
			
			}else {
				 response.sendRedirect("login.jsp?error= Invalid username or password");
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
