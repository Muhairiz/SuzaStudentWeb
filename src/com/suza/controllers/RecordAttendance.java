package com.suza.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.suza.db.AttendanceDb;
import com.suza.model.Attendance;

/**
 * Servlet implementation class RecordAttendance
 */
@WebServlet("/RecordAttendance")
public class RecordAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecordAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		List<Attendance> attList =new ArrayList<Attendance>();
		String week = request.getParameter("week");
		int weeks =Integer.parseInt(week);
		String att_date =request.getParameter("att_date");
		String course = request.getParameter("course");
		String recorder = request.getParameter("recorder");
		
		String[] reg = request.getParameterValues("regNo");
		String[] name = request.getParameterValues("fname");
		String[] status =request.getParameterValues("status");
		
		for(int i=0; i<reg.length; i++) {
			Attendance att = new Attendance();
			att.setWeek(weeks);
			att.setDate(att_date);
			att.setCourse(course);
			att.setRecorded(recorder);
			att.setStudentReg(reg[i]);
			att.setStudentName(name[i]);
			att.setStatus(status[i]);
			
			attList.add(att);
		}
		
		int result=AttendanceDb.record(attList);
		
        if(result > 0){
        	pw.println("Saved");
        }else{
            pw.println("Sorry! unable to save record");
        }

        pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
