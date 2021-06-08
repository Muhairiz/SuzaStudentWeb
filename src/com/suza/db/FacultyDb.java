package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
	
	public static List<Faculty> getAllFaculty(){
        List<Faculty> list=new ArrayList<Faculty>();
        try{
            Connection con=FacultyDb.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from facults");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	Faculty flt=new Faculty();
            	
            	flt.setFacultyCode(rs.getString(1));
            	flt.setFacultyName(rs.getString(2));
            	flt.setDuration(rs.getString(3));
                list.add(flt);
            }
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return list;
    }
	
	public static Faculty getFacultyById(String flt_code){
		Faculty flt=new Faculty();

	        try{
	            Connection con=FacultyDb.getConnection();
	            PreparedStatement ps=con.prepareStatement("select * from facults where facult_code=?");
	            ps.setString(1,flt_code);
	            ResultSet rs=ps.executeQuery();
	            if(rs.next()){
	            	flt.setFacultyCode(rs.getString(1));
	            	flt.setFacultyName(rs.getString(2));
	            	flt.setDuration(rs.getString(3));
	            	flt.setRecorder(rs.getString(4));
	            }
	            con.close();
	        }catch(Exception ex){ex.printStackTrace();}
	        
	        return flt;
	    }
	
	public static int updateFaculty(Faculty flt) {
		int result=0;
        try{
            Connection con=FacultyDb.getConnection();
            PreparedStatement ps=con.prepareStatement("update facults set facult_name=?,duration=?,recorded=? where facult_code=?");
            
            ps.setString(1, flt.getFacultyName());
			ps.setString(2, flt.getDuration());
            ps.setString(3,flt.getRecorder());
            ps.setString(4,flt.getFacultyCode());
            
            result=ps.executeUpdate();

            con.close();
        }catch(Exception ex){ex.printStackTrace();}
		return result;
	}
	
}

