package com.suza.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.suza.db.DepartmentDb;
import com.suza.model.Department;

/**
 * Servlet implementation class SaveDepartment
 */
@WebServlet("/SaveDepartment")
public class SaveDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveDepartment() {
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
		 
		 String dep_code=request.getParameter("dep_code");
		 String dep_name=request.getParameter("dep_name");
		 String recorder=request.getParameter("recorder");
		 
		 Department dep=new Department();
		 
		 dep.setDepCode(dep_code);
		 dep.setDepName(dep_name);
		 dep.setRecorder(recorder);
		 
		 
		 int result=DepartmentDb.saveDepartment(dep);
	        if(result>0){
	        	response.sendRedirect("views/admin/viewdepartment.jsp");
	        }else{
	            out.println("Sorry! unable to save record");
	            response.sendRedirect("views/admin/registerdepartment.jsp");
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
