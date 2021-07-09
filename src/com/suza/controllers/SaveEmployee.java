package com.suza.controllers;

import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.suza.db.EmployeeDb;
import com.suza.model.Employee;

/**
 * Servlet implementation class SaveEmployee
 */
@WebServlet("/SaveEmployee")
public class SaveEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveEmployee() {
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
		 
		 String emp_no=request.getParameter("emp_no");
		 String fname=request.getParameter("fname");
		 String mname=request.getParameter("mname");
		 String lname=request.getParameter("lname");
		 String dob=request.getParameter("dob");
		 String qualification=request.getParameter("qualification");
		 String phone=request.getParameter("phone");
		 String email=request.getParameter("emailS");
		 String gender=request.getParameter("gender");
		 String pass=request.getParameter("password");
		 String roll=request.getParameter("roll");
		 String department=request.getParameter("department");
		 String phisical=request.getParameter("phisical");
		 String recorder=request.getParameter("recorder");
		 
		 Employee emp=new Employee();
		 
		 emp.setId(emp_no);
		 emp.setFirstName(fname);
		 emp.setMiddleName(mname);
		 emp.setLastName(lname);
		 emp.setDob(dob);
		 emp.setQualification(qualification);
		 emp.setPhone(phone);
		 emp.setEmail(email);
		 emp.setGender(gender);
		 emp.setPassword(pass);
		 emp.setRoll(roll);
		 emp.setDepartment(department);
		 emp.setPhisical(phisical);
		 emp.setRecorded(recorder);
		 
		 int result=EmployeeDb.saveEmployee(emp);
		 
	        if(result>0){
	        	response.sendRedirect("views/admin/registeracademic.jsp?success= Data saved Successfully");
	        }else{
	        	
	            response.sendRedirect("views/admin/registeracademic.jsp?error= Sorry! unable to save record");
	        }

	        out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
