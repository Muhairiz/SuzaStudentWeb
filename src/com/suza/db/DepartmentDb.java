package com.suza.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.suza.model.Department;
public class DepartmentDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public static int saveDepartment(Department dep) {
		int result =0;
		
		try {
			Connection conn=DepartmentDb.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into departments(department_code,department_name,recorded) values(?,?,?)");
			ps.setString(1, dep.getDepCode());
			ps.setString(2, dep.getDepName());
			ps.setString(3, dep.getRecorder());
			result =ps.executeUpdate();
			conn.close();
		}catch(Exception ex){ex.printStackTrace();}

        return result;
	}
	
	public static List<Department> getAllDepartment(){
        List<Department> list=new ArrayList<Department>();
        try{
            Connection con=DepartmentDb.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from departments");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	Department dep=new Department();
            	dep.setDepCode(rs.getString(1));
            	dep.setDepName(rs.getString(2));
                list.add(dep);
            }
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return list;
    }
	
	public static int delete(String dep_code){
        int status=0;
        try{
        	Connection con=DepartmentDb.getConnection();
            PreparedStatement ps=con.prepareStatement("delete from departments where department_code=?");
            ps.setString(1,dep_code);
            status=ps.executeUpdate();
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return status;
    }
	
	public static Department getDepartmentById(String dep_code){
		Department dep=new Department();

	        try{
	            Connection con=DepartmentDb.getConnection();
	            PreparedStatement ps=con.prepareStatement("select * from departments where department_code=?");
	            ps.setString(1,dep_code);
	            ResultSet rs=ps.executeQuery();
	            if(rs.next()){
	            	dep.setDepCode(rs.getString(1));
	            	dep.setDepName(rs.getString(2));
	            	dep.setRecorder(rs.getString(3));
	            }
	            con.close();
	        }catch(Exception ex){ex.printStackTrace();}
	        
	        return dep;
	    }

	public static int updateDepartment(Department dep) {
		int result=0;
        try{
            Connection con=DepartmentDb.getConnection();
            PreparedStatement ps=con.prepareStatement("update departments set department_name=?,recorded=? where department_code=?");
            
            ps.setString(1, dep.getDepName());
			ps.setString(2, dep.getRecorder());
            ps.setString(3,dep.getDepCode());
            
            result=ps.executeUpdate();

            con.close();
        }catch(Exception ex){ex.printStackTrace();}
		return result;
	}
	
}
