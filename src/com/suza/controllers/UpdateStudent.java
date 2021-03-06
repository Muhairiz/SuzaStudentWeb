package com.suza.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suza.db.StudentDb;
import com.suza.model.Student;

/**
 * Servlet implementation class UpdateStudent
 */
@WebServlet("/UpdateStudent")
public class UpdateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudent() {
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
		 
		 String regNo=request.getParameter("reg_no");
		 String fname=request.getParameter("fname");
		 String mname=request.getParameter("mname");
		 String lname=request.getParameter("lname");
		 String dob=request.getParameter("dob");
		 String admission=request.getParameter("admission");
		 String completion=request.getParameter("completion");
		 String gender=request.getParameter("gender");
		 String phone=request.getParameter("phone");
		 String email=request.getParameter("email");
		 String phisical=request.getParameter("physical");
		 String password=request.getParameter("password");
		 String facult=request.getParameter("facult");
		 String enrollment=request.getParameter("enrolling");
		 String recorder=request.getParameter("recorder");
		 
		 Student std=new Student();
		 
		 std.setReg(regNo);
		 std.setFirstname(fname);
		 std.setMiddlename(mname);
		 std.setLastname(lname);
		 std.setDob(dob);
		 std.setAdmissionYear(admission);
		 std.setComplitionYear(completion);
		 std.setGender(gender);
		 std.setPhone(phone);
		 std.setEmail(email);	
		 std.setPhisical(phisical);
		 std.setPassword(password);
		 std.setFacult(facult);
		 std.setEnrolled(enrollment);
		 std.setRecorded(recorder);
		 
		 int result=StudentDb.updateStudent(std);
		 
	        if(result>0){
	            out.print("<p>Record updated successfully!</p>");
	            response.sendRedirect("views/admin/viewstudents.jsp");
	        }else{
	            out.println("Sorry! unable to save record");
	            response.sendRedirect("views/admin/updatestudent.jsp");
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
