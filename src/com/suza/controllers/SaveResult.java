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
import com.suza.db.ResultDb;
import com.suza.model.Result;

/**
 * Servlet implementation class SaveResult
 */
@WebServlet("/SaveResult")
public class SaveResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		List<Result> rstList =new ArrayList<Result>();
		
		String cw_date =request.getParameter("rst_date");
		String course = request.getParameter("course");
		String recorder = request.getParameter("recorder");
				
		String[] reg = request.getParameterValues("regNo");
		String[] score =request.getParameterValues("score");
		
		double[] scores = Arrays.stream(score).mapToDouble(Double::parseDouble).toArray();
		
		for(int i=0; i<reg.length; i++) {
			Result rst = new Result();
			rst.setRstDate(cw_date);
			rst.setCourse(course);
			rst.setRecorder(recorder);
			rst.setStudent(reg[i]);
			rst.setScore(scores[i]);
			
			rstList.add(rst);
		}
		
		int result=ResultDb.saveResult(rstList);
		
        if(result > 0){
        	response.sendRedirect("views/dataentry/result.jsp?success= Record saved successfully!");
        }else{
            response.sendRedirect("views/dataentry/result.jsp?error= Sorry! unable to save");
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
