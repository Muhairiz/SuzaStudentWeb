package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.suza.model.Results;

public class ResultsDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static List<Results> getAllResults(){
        List<Results> list=new ArrayList<Results>();
        try{
            Connection con=ResultsDb.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from results");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	Results rslt=new Results();
            	
            	rslt.setRegNo(rs.getString(1));
            	rslt.setFirstName(rs.getString(2));
            	rslt.setLastName(rs.getString(3));
            	rslt.setEnroll(rs.getString(4));
            	rslt.setCourseCode(rs.getString(5));
            	rslt.setCourseName(rs.getString(6));
            	rslt.setSemester(rs.getInt(7));
            	rslt.setYear(rs.getInt(8));
            	rslt.setCategory(rs.getString(9));
            	rslt.setCredit(rs.getInt(10));
            	rslt.setCoursework(rs.getDouble(11));
            	rslt.setRecorded(rs.getString(12));
            	rslt.setFinalexam(rs.getDouble(13));
            	rslt.setTotal(rs.getDouble(14));
            	list.add(rslt);
            }
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return list;
    }
}
