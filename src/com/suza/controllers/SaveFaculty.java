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
 * Servlet implementation class SaveFaculty
 */
@WebServlet("/SaveFaculty")
public class SaveFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveFaculty() {
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
		 
		 String f_code=request.getParameter("flt_code");
		 String f_name=request.getParameter("flt_name");
		 String duration=request.getParameter("duration");
		 String recorder=request.getParameter("recorder");
		 
		 Faculty facult=new Faculty();
		 
		 facult.setFacultyCode(f_code);
		 facult.setFacultyName(f_name);
		 facult.setDuration(duration);
		 facult.setRecorder(recorder);
		 
		 
		 int result=FacultyDb.saveFaculty(facult);
		 
	        if(result>0){
	        	response.sendRedirect("views/admin/viewfaculty.jsp");
	        }else{
	            out.println("Sorry! unable to save record");
	            response.sendRedirect("views/admin/registerfaculty.jsp");
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
