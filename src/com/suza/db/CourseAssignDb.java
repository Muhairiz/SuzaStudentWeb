package com.suza.db;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.suza.model.CourseAssign;

public class CourseAssignDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static int saveAssignCourse(CourseAssign crsa) {
		int result =0;
		
		try {
			Connection conn=CourseAssignDb.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into course_assignment(course,employee,faculty,recorder) values(?,?,?,?)");
			ps.setString(1, crsa.getCourse());
			ps.setString(2, crsa.getEmployee());
			ps.setString(3, crsa.getFaculty());
			ps.setString(4, crsa.getRecorder());
			result =ps.executeUpdate();
			conn.close();
		}catch(Exception ex){ex.printStackTrace();}

        return result;
	}
	
	public static List<CourseAssign> getAllAssignedCourse(){
        List<CourseAssign> list=new ArrayList<CourseAssign>();
        try{
            Connection con=CourseAssignDb.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from course_assignment");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	CourseAssign ca=new CourseAssign();
            	ca.setId(rs.getInt(1));
            	ca.setCourse(rs.getString(2));
            	ca.setEmployee(rs.getString(3));
            	ca.setFaculty(rs.getString(4));
            	ca.setRecorder(rs.getString(5));
                list.add(ca);
            }
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return list;
    }
	
	public static CourseAssign getAssignedById(String id){
		CourseAssign ca=new CourseAssign();

	        try{
	            Connection con=CourseAssignDb.getConnection();
	            PreparedStatement ps=con.prepareStatement("select * from course_assignment where assign_id=?");
	            ps.setString(1,id);
	            ResultSet rs=ps.executeQuery();
	            if(rs.next()){
	            	ca.setId(rs.getInt(1));
	            	ca.setCourse(rs.getString(2));
	            	ca.setEmployee(rs.getString(3));
	            	ca.setFaculty(rs.getString(4));
	            	ca.setRecorder(rs.getString(5));
	            }
	            con.close();
	        }catch(Exception ex){ex.printStackTrace();}
	        
	        return ca;
	    }
}
