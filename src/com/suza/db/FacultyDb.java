package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import com.suza.model.Faculty;

public class FacultyDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static int saveFaculty(Faculty facult) {
		int result =0;
		
		try {
			Connection conn=FacultyDb.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into facults(facult_code,facult_name,duration,recorded) values(?,?,?,?)");
			ps.setString(1, facult.getFacultyCode());
			ps.setString(2, facult.getFacultyName());
			ps.setString(3, facult.getDuration());
			ps.setString(4, facult.getRecorder());
			result =ps.executeUpdate();
			conn.close();
		}catch(Exception ex){ex.printStackTrace();}

        return result;
	}
}
