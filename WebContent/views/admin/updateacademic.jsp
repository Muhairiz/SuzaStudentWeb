<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.EmployeeDb, com.suza.model.Employee" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>

	<%
		String id=request.getParameter("id");	
		Employee emp=EmployeeDb.getEmployeeById(id);
	%>

	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Update Staff Form</h1>
	
	<form action="../../UpdateEmployee" method="POST" name="myForm" class="form">
	
		<input type="hidden" name="id" value="<%=emp.getId() %>">
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> First Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="fname" value="<%=emp.getFirstName() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Middle Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="mname" value="<%=emp.getMiddleName() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Last Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="lname" value="<%=emp.getLastName() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Date of Birth: <span class="text-danger">*</span></label>
			     <input class="form-control" type="date" name="dob" value="<%=emp.getDob() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Qualification: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="qualification" value="<%=emp.getQualification() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Phone: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="phone" value="<%=emp.getPhone() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Email: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="email" value="<%=emp.getEmail() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Gender:</label>
			 <div class="form-group col-md-4">  	 	
			     <input type="radio" name="gender" value="Male" checked>   Male				 	
			     <input type="radio" name="gender" value="Female">  Female
			 </div>
     		</div>
     	</div><div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Password: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="password" value="<%=emp.getPassword() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Roll: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="roll" value="<%=emp.getRoll() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Department: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="department" value="<%=emp.getDepartment() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Physical Address: </label>
			     <input class="form-control" type="text" name="address" value="<%=emp.getPhisical() %>">
     		</div>
     	</div>
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	
     	<input class="btn btn-success" type="submit" value="Update">
     	<a href="viewacademic.jsp" class="btn btn-danger">Cancel</a>
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>