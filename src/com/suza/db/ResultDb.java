package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import com.suza.model.Result;

public class ResultDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static int saveResult(List<Result> rstList) {
		int result =0;
		
		try(Connection conn=ResultDb.getConnection();) {
			PreparedStatement ps=conn.prepareStatement("insert into final_exams(student,course,score,final_date,recorded) values(?,?,?,?,?)");
			
			for(Result rst:rstList) {				
				ps.setString(1, rst.getStudent());
				ps.setString(2, rst.getCourse());
				ps.setDouble(3, rst.getScore());
				ps.setString(4, rst.getRstDate());
				ps.setString(5, rst.getRecorder());
				result =ps.executeUpdate();				
			}			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return result;
	}
}
