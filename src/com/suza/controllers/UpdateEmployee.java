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
 * Servlet implementation class UpdateEmployee
 */
@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployee() {
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
	     String emp_no=request.getParameter("id");
		 String fname=request.getParameter("fname");
		 String mname=request.getParameter("mname");
		 String lname=request.getParameter("lname");
		 String dob=request.getParameter("dob");
		 String qualification=request.getParameter("qualification");
		 String phone=request.getParameter("phone");
		 String email=request.getParameter("email");
		 String gender=request.getParameter("gender");
		 String pass=request.getParameter("pass");
		 String roll=request.getParameter("roll");
		 String department=request.getParameter("department");
		 String address=request.getParameter("address");
		 String recorder=request.getParameter("recorder");
		 
		 Employee emp=new Employee();
		 
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
		 emp.setPhisical(address);
		 emp.setRecorded(recorder);
		 emp.setId(emp_no);
		 
		 int result=EmployeeDb.updateEmployee(emp);
		 
	        if(result>0){
	            out.print("<p>Record updated successfully!</p>");
	            response.sendRedirect("views/admin/viewacademic.jsp");
	        }else{
	            out.println("Sorry! unable to save record");
	            response.sendRedirect("views/admin/updateacademic.jsp");
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
