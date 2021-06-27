package com.suza.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suza.db.CourseDb;
import com.suza.model.Course;

/**
 * Servlet implementation class UpdateCourse
 */
@WebServlet("/UpdateCourse")
public class UpdateCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCourse() {
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
		 String c_name=request.getParameter("c_name");
		 String semester=request.getParameter("semester");
		 String academic=request.getParameter("academic");
		 String duration=request.getParameter("duration");
		 String category=request.getParameter("category");
		 String cr=request.getParameter("credit");
		 int credit = Integer.parseInt(cr);
		 String recorder=request.getParameter("recorder");
		 
		 Course crs=new Course();
		 
		 crs.setCourseCode(c_code);
		 crs.setCourseName(c_name);
		 crs.setSemester(semester);
		 crs.setAcademicYear(academic);
		 crs.setDuration(duration);
		 crs.setCateory(category);
		 crs.setCredit(credit);
		 crs.setRecorder(recorder);
		 
		 int result=CourseDb.updateCourse(crs);
	        if(result>0){
	        	response.sendRedirect("views/admin/viewcourse.jsp");
	        }else{
	            out.println("Sorry! unable to save record");
	            response.sendRedirect("views/admin/registercourse.jsp");
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
