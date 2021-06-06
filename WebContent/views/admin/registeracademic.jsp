<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.DepartmentDb" %>
	<%@ page import="com.suza.model.Department" %>
<!DOCTYPE html>
<html>
	<%@ include file="../../includes/head.jsp" %>
<body>
	<%
		List<Department> list=DepartmentDb.getAllDepartment();
	%>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
	<%@ include file="../../includes/header.jsp" %>	
<div class="content">	
		<h1 class="text-center">Employee Registration Form</h1>
		
		<form action="../../SaveEmployee" method="POST" class="form">	
       	 <div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Employee Number:</label>
			     <input class="form-control" type="text" name="emp_no">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>First Name:</label>
			     <input class="form-control" type="text" name="fname">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Middle Name:</label>
			     <input class="form-control" type="text" name="mname">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Last Name:</label>
			     <input class="form-control" type="text" name="lname" >
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Date of Birth:</label>
			     <input class="form-control" type="date" name="dob" >
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Qualification:</label>
			     <input class="form-control" type="text" name="qualification">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Phone:</label>
			     <input class="form-control" type="text" name="phone" >
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Email Address:</label>
			     <input class="form-control" type="text" name="email" >
     		</div>
     	</div>
     	<div  class ="row form-horizontal">
			<div class="form-group col-md-6">  	 	
			     <label> Gender:</label>
			 <div class="form-group col-md-4">  	 	
			     <input type="radio" name="gender" value="Male">   Male				 	
			     <input type="radio" name="gender" value="Female">  Female
			 </div>
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Password:</label>
			     <input class="form-control" type="password" name="password">
     		</div>
     	</div>
     	
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Roll:</label>
			     <input class="form-control" type="text" name="roll">
     		</div>
     		<div class="form-group col-md-6">
			     <label>Department:</label>
			     <select class="form-control" name="department">
				<% for(Department dep:list){ %>
				<option><%= dep.getDepCode() %></option>
				<%} %>
				</select>
     		</div>
     	</div>
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Physical Address:</label>
			     <input class="form-control" type="text" name="phisical" >
     		</div>
     	</div>
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	
     	<input class="btn btn-success" type="submit" name="save_user" value="SAVE">
    </form>	
	</div>
	 
<%@ include file="../../includes/footer.jsp"%>
</body>
</html>