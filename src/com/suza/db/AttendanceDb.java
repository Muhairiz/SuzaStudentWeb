package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import com.suza.model.Attendance;

public class AttendanceDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static int record(List<Attendance> attList) {
		int result =0;
		
		try(Connection conn=StudentDb.getConnection();) {
			PreparedStatement ps=conn.prepareStatement("insert into attendances(week,attend_date,course,student,full_name,status,recorded) values(?,?,?,?,?,?,?)");
			
			for(Attendance att:attList) {
				
				ps.setInt(1, att.getWeek());
				ps.setString(2, att.getDate());
				ps.setString(3, att.getCourse());
				ps.setString(4, att.getStudentReg());
				ps.setString(5, att.getStudentName());
				ps.setString(6, att.getStatus());
				ps.setString(7, att.getRecorded());
				result =ps.executeUpdate();
				
			}			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return result;
	}
	
}
