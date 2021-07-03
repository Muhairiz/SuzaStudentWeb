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
			PreparedStatement ps=conn.prepareStatement("insert into course_assignment(course,employee,faculty,year,recorder) values(?,?,?,?,?)");
			ps.setString(1, crsa.getCourse());
			ps.setString(2, crsa.getEmployee());
			ps.setString(3, crsa.getFaculty());
			ps.setInt(4, crsa.getYear());
			ps.setString(5, crsa.getRecorder());
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
            	ca.setYear(rs.getInt(5));
            	ca.setRecorder(rs.getString(6));
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
	            	ca.setYear(rs.getInt(5));
	            	ca.setRecorder(rs.getString(6));
	            }
	            con.close();
	        }catch(Exception ex){ex.printStackTrace();}
	        
	        return ca;
	    }
	
	public static int delete(String id){
        int status=0;
        try{
        	Connection con=CourseAssignDb.getConnection();
            PreparedStatement ps=con.prepareStatement("delete from course_assignment where assign_id=?");
            ps.setString(1,id);
            status=ps.executeUpdate();
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return status;
    }
	
	public static int updateCourseAssign(CourseAssign crsa) {
		int result=0;
        try{
            Connection con=CourseAssignDb.getConnection();
            PreparedStatement ps=con.prepareStatement("update course_assignment set course=?,employee=?,faculty=?,year=?,recorder=? where assign_id=?");
            
            ps.setString(1, crsa.getCourse());
			ps.setString(2, crsa.getEmployee());
			ps.setString(3, crsa.getFaculty());
			ps.setInt(4, crsa.getYear());
			ps.setString(5, crsa.getRecorder());
			ps.setInt(6, crsa.getId());
            
            result=ps.executeUpdate();

            con.close();
        }catch(Exception ex){ex.printStackTrace();}
		return result;
	}
	
	public static List<CourseAssign> getAssignedByStaff(String no){
        List<CourseAssign> list=new ArrayList<CourseAssign>();
        try{
            Connection con=CourseAssignDb.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from course_assignment where employee=?");
            ps.setString(1,no);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	CourseAssign ca=new CourseAssign();
            	ca.setId(rs.getInt(1));
            	ca.setCourse(rs.getString(2));
            	ca.setEmployee(rs.getString(3));
            	ca.setFaculty(rs.getString(4));
            	ca.setYear(rs.getInt(5));
            	ca.setRecorder(rs.getString(6));
                list.add(ca);
            }
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return list;
    }
	
}
