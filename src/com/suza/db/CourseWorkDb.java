package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import com.suza.model.CourseWork;

public class CourseWorkDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static int saveCourseWork(List<CourseWork> cwList) {
		int result =0;
		
		try(Connection conn=CourseWorkDb.getConnection();) {
			PreparedStatement ps=conn.prepareStatement("insert into courseworks(student,course,score,coursework_date,recorded) values(?,?,?,?,?)");
			
			for(CourseWork cw:cwList) {				
				ps.setString(1, cw.getStudent());
				ps.setString(2, cw.getCourse());
				ps.setDouble(3, cw.getScore());
				ps.setString(4, cw.getCwDate());
				ps.setString(5, cw.getRecorder());
				result =ps.executeUpdate();				
			}			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return result;
	}
	
}
