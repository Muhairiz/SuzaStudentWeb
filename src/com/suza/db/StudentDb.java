package com.suza.db;

import java.sql.*;
import com.suza.model.Student;

public class StudentDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static int saveStudent(Student std) {
		int result =0;
		
		try {
			Connection conn=StudentDb.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into students(student_reg,first_name,middle_name,last_name,dob,addmission_year,completion_year,gender,phone,email,phisical,password,facult,recorded) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, std.getReg());
			ps.setString(2, std.getFirstname());
			ps.setString(3, std.getMiddlename());
			ps.setString(4, std.getLastname());
			ps.setString(5, std.getDob());
			ps.setString(6, std.getAdmissionYear());
			ps.setString(7, std.getComplitionYear());
			ps.setString(8, std.getGender());
			ps.setString(9, std.getPhone());
			ps.setString(10, std.getEmail());
			ps.setString(11, std.getPhisical());
			ps.setString(12, std.getPassword());
			ps.setString(13, std.getFacult());
			ps.setString(14, std.getRecorded());
			result =ps.executeUpdate();
			conn.close();
		}catch(Exception ex){ex.printStackTrace();}

        return result;
	}
}
