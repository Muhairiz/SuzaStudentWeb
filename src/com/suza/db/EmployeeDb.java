package com.suza.db;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.suza.model.Employee;

public class EmployeeDb {

	public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/suza_student_app","root","");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
	
	public Employee checkLogin(String username,String password) throws SQLException {
		 
		 Connection con=EmployeeDb.getConnection();
		 String sql ="select * from employees where employee_no=? and password=?";
		 PreparedStatement ps=con.prepareStatement(sql);
		 
		 ps.setString(1,username);
		 ps.setString(2,password);
		 ResultSet result =ps.executeQuery();
		 
		 Employee emp=null;
		
		if(result.next()) {
			emp= new Employee();
			emp.setFirstName(result.getString("first_name"));
			emp.setLastName(result.getString("last_name"));
			emp.setId(result.getString("employee_no"));
			emp.setPassword(result.getString("password"));
			emp.setRoll(result.getString("roll"));
		}
		con.close();
		return emp;
		 
	 }
	
	public static int saveEmployee(Employee emp) {
		int result =0;
		
		try {
			Connection conn=EmployeeDb.getConnection();
			PreparedStatement ps=conn.prepareStatement("insert into employees(employee_no,first_name,middle_name,last_name,dob,qualification,phone,email,gender,password,roll,department,phisical_add,recorded) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, emp.getId());
			ps.setString(2, emp.getFirstName());
			ps.setString(3, emp.getMiddleName());
			ps.setString(4, emp.getLastName());
			ps.setString(5, emp.getDob());
			ps.setString(6, emp.getQualification());
			ps.setString(7, emp.getPhone());
			ps.setString(8, emp.getEmail());
			ps.setString(9, emp.getGender());
			ps.setString(10, emp.getPassword());
			ps.setString(11, emp.getRoll());
			ps.setString(12, emp.getDepartment());
			ps.setString(13, emp.getPhisical());
			ps.setString(14, emp.getRecorded());
			result =ps.executeUpdate();
			conn.close();
		}catch(Exception ex){ex.printStackTrace();}

        return result;
	}
	
	public static List<Employee> getAllEmployee(){
        List<Employee> list=new ArrayList<Employee>();
        try{
            Connection con=EmployeeDb.getConnection();
            PreparedStatement ps=con.prepareStatement("select * from employees");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	Employee emp=new Employee();
            	emp.setId(rs.getString(1));
            	emp.setFirstName(rs.getString(2));
            	emp.setMiddleName(rs.getString(3));
            	emp.setLastName(rs.getString(4));
            	emp.setDob(rs.getString(5));
            	emp.setQualification(rs.getString(6));
            	emp.setPhone(rs.getString(7));
            	emp.setEmail(rs.getString(8));
            	emp.setGender(rs.getString(9));
            	emp.setPassword(rs.getString(10));
            	emp.setRoll(rs.getString(11));
            	emp.setDepartment(rs.getString(12));
            	emp.setPhisical(rs.getString(13));
                list.add(emp);
            }
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return list;
    }
	
	public static Employee getEmployeeById(String id){
		Employee emp=new Employee();

	        try{
	            Connection con=EmployeeDb.getConnection();
	            PreparedStatement ps=con.prepareStatement("select * from employees where employee_no=?");
	            ps.setString(1,id);
	            ResultSet rs=ps.executeQuery();
	            if(rs.next()){
	            	emp.setId(rs.getString(1));
	            	emp.setFirstName(rs.getString(2));
	            	emp.setMiddleName(rs.getString(3));
	            	emp.setLastName(rs.getString(4));
	            	emp.setDob(rs.getString(5));
	            	emp.setQualification(rs.getString(6));
	            	emp.setPhone(rs.getString(7));
	            	emp.setEmail(rs.getString(8));
	            	emp.setGender(rs.getString(9));
	            	emp.setPassword(rs.getString(10));
	            	emp.setRoll(rs.getString(11));
	            	emp.setDepartment(rs.getString(12));
	            	emp.setPhisical(rs.getString(13));
	            	emp.setRecorded(rs.getString(14));
	            }
	            con.close();
	        }catch(Exception ex){ex.printStackTrace();}
	        
	        return emp;
	    }

	public static int updateEmployee(Employee emp) {
		int result=0;
        try{
            Connection con=EmployeeDb.getConnection();
            PreparedStatement ps=con.prepareStatement("update employees set first_name=?,middle_name=?,last_name=?,dob=?,qualification=?,phone=?,email=?,gender=?,password=?,roll=?,department=?,phisical_add=?,recorded=? where employee_no=?");
            
            ps.setString(1, emp.getFirstName());
			ps.setString(2, emp.getMiddleName());
			ps.setString(3, emp.getLastName());
			ps.setString(4, emp.getDob());
			ps.setString(5, emp.getQualification());
			ps.setString(6, emp.getPhone());
			ps.setString(7, emp.getEmail());
			ps.setString(8, emp.getGender());
			ps.setString(9, emp.getPassword());
			ps.setString(10, emp.getRoll());
			ps.setString(11, emp.getDepartment());
			ps.setString(12, emp.getPhisical());
			ps.setString(13, emp.getRecorded());
            ps.setString(14,emp.getId());
            
            result=ps.executeUpdate();

            con.close();
        }catch(Exception ex){ex.printStackTrace();}
		return result;
	}
	
	public static int delete(String emp_no){
        int status=0;
        try{
        	Connection con=EmployeeDb.getConnection();
            PreparedStatement ps=con.prepareStatement("delete from employees where employee_no=?");
            ps.setString(1,emp_no);
            status=ps.executeUpdate();
            con.close();
        }catch(Exception e){e.printStackTrace();}

        return status;
    }
}

