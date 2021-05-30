package com.suza.db;
import java.sql.*;
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
	
}










































