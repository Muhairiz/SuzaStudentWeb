package com.suza.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suza.db.CourseWorkDb;
import com.suza.model.CourseWork;

/**
 * Servlet implementation class SaveCourseWork
 */
@WebServlet("/SaveCourseWork")
public class SaveCourseWork extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveCourseWork() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		List<CourseWork> cwList =new ArrayList<CourseWork>();
		
		String cw_date =request.getParameter("cw_date");
		String course = request.getParameter("course");
		String recorder = request.getParameter("recorder");
				
		String[] reg = request.getParameterValues("regNo");
		String[] score =request.getParameterValues("score");
		
		double[] scores = Arrays.stream(score).mapToDouble(Double::parseDouble).toArray();
		
		for(int i=0; i<reg.length; i++) {
			CourseWork cw = new CourseWork();
			cw.setCwDate(cw_date);
			cw.setCourse(course);
			cw.setRecorder(recorder);
			cw.setStudent(reg[i]);
			cw.setScore(scores[i]);
			
			cwList.add(cw);
		}
		
		int result=CourseWorkDb.saveCourseWork(cwList);
		
        if(result > 0){
        	response.sendRedirect("views/staff/coursework.jsp?success= Record saved successfully!");
        }else{
            response.sendRedirect("views/staff/coursework.jsp?error= Sorry! unable to save");
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
