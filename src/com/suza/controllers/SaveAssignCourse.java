package com.suza.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suza.db.CourseAssignDb;
import com.suza.model.CourseAssign;

/**
 * Servlet implementation class SaveAssignCourse
 */
@WebServlet("/SaveAssignCourse")
public class SaveAssignCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveAssignCourse() {
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
		 
		 String c_code=request.getParameter("c_code");
		 String staff=request.getParameter("staff");
		 String faculty=request.getParameter("faculty");
		 String enroll=request.getParameter("enrolling");
		 String ac_year=request.getParameter("academic");
		 int year = Integer.parseInt(ac_year);
		 String recorder=request.getParameter("recorder");
		 
		 CourseAssign crsa =new CourseAssign();
		 
		 crsa.setCourse(c_code);
		 crsa.setEmployee(staff);
		 crsa.setFaculty(faculty);
		 crsa.setEnroll(enroll);
		 crsa.setRecorder(recorder);
		 crsa.setYear(year);
		 
		 
		 int result=CourseAssignDb.saveAssignCourse(crsa);
	        if(result>0){
	        	response.sendRedirect("views/admin/viewcourseassign.jsp");
	        }else{
	            out.println("Sorry! unable to save record");
	            response.sendRedirect("views/admin/courseassign.jsp");
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
