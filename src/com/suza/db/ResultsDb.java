package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.suza.model.Faculty;

public class ResultsDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
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
}
