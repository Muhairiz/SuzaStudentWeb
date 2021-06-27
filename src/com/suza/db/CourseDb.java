package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.suza.model.Course;

public class CourseDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static int saveCourse(Course crs) {
		int result =0;
		
		try {
			Connection conn=CourseDb.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into courses(course_code,course_name,semester,academic_year,duration,category,credit,recorded) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, crs.getCourseCode());
			ps.setString(2, crs.getCourseName());
			ps.setString(3, crs.getSemester());
			ps.setString(4, crs.getAcademicYear());
			ps.setString(5, crs.getDuration());
			ps.setString(6, crs.getCateory());
			ps.setInt(7, crs.getCredit());
			ps.setString(8, crs.getRecorder());
			result =ps.executeUpdate();
			conn.close();
		}catch(Exception ex){ex.printStackTrace();}

        return result;
	}
	
	public static List<Course> getAllCourse(){
        List<Course> list=new ArrayList<Course>();
        try{
            Connection con=CourseDb.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from courses");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	Course crs=new Course();
            	crs.setCourseCode(rs.getString(1));
            	crs.setCourseName(rs.getString(2));
            	crs.setSemester(rs.getString(3));
            	crs.setAcademicYear(rs.getString(4));
            	crs.setDuration(rs.getString(5));
            	crs.setCateory(rs.getString(6));
            	crs.setCredit(rs.getInt(7));
            	crs.setRecorder(rs.getString(8));
                list.add(crs);
            }
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return list;
    }
	
	public static Course getCourseById(String crs_code){
		Course crs=new Course();

	        try{
	            Connection con=CourseDb.getConnection();
	            PreparedStatement ps=con.prepareStatement("select * from courses where course_code=?");
	            ps.setString(1,crs_code);
	            ResultSet rs=ps.executeQuery();
	            if(rs.next()){
	            	crs.setCourseCode(rs.getString(1));
	            	crs.setCourseName(rs.getString(2));
	            	crs.setSemester(rs.getString(3));
	            	crs.setAcademicYear(rs.getString(4));
	            	crs.setDuration(rs.getString(5));
	            	crs.setCateory(rs.getString(6));
	            	crs.setCredit(rs.getInt(7));
	            	crs.setRecorder(rs.getString(8));
	            }
	            con.close();
	        }catch(Exception ex){ex.printStackTrace();}
	        
	        return crs;
	    }
	
	public static int updateCourse(Course crs) {
		int result=0;
        try{
            Connection con=CourseDb.getConnection();
            PreparedStatement ps=con.prepareStatement("update courses set course_name=?,semester=?,academic_year=?,duration=?,category=?,credit=?,recorded=? where course_code=?");
            
            ps.setString(1, crs.getCourseName());
			ps.setString(2, crs.getSemester());
            ps.setString(3,crs.getAcademicYear());
            ps.setString(4,crs.getDuration());
            ps.setString(5,crs.getCateory());
            ps.setInt(6,crs.getCredit());
            ps.setString(7,crs.getRecorder());
            ps.setString(8,crs.getCourseCode());
            
            result=ps.executeUpdate();

            con.close();
        }catch(Exception ex){ex.printStackTrace();}
		return result;
	}
	
	public static int delete(String crs_code){
        int status=0;
        try{
        	Connection con=CourseDb.getConnection();
            PreparedStatement ps=con.prepareStatement("delete from courses where course_code=?");
            ps.setString(1,crs_code);
            status=ps.executeUpdate();
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return status;
    }
	
}
