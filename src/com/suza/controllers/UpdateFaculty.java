package com.suza.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.suza.db.FacultyDb;
import com.suza.model.Faculty;

/**
 * Servlet implementation class UpdateFaculty
 */
@WebServlet("/UpdateFaculty")
public class UpdateFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFaculty() {
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
	     
	     String flt_code=request.getParameter("flt_code");
		 String flt_name=request.getParameter("flt_name");
		 String duration=request.getParameter("duration");
		 String recorder=request.getParameter("recorder");
		 
		 Faculty flt=new Faculty();
		 flt.setFacultyName(flt_name);
		 flt.setDuration(duration);
		 flt.setRecorder(recorder);
		 flt.setFacultyCode(flt_code);
		 
		 int result=FacultyDb.updateFaculty(flt);
		 
	        if(result>0){
	            out.print("<p>Record updated successfully!</p>");
	            response.sendRedirect("views/admin/viewfaculty.jsp");
	        }else{
	            out.println("Sorry! unable to save record");
	            response.sendRedirect("views/admin/updatedepartment.jsp");
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
