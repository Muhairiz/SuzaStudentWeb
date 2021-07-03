<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.FacultyDb, com.suza.model.Faculty" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%
		List<Faculty> list=FacultyDb.getAllFaculty();
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Student Registration Form</h1>
	
	<form action="../../SaveStudent" method="POST" class="form">	
       	 <div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Registration Number:</label>
			     <input class="form-control" type="text" name="reg_no">
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
			     <label> Admission Year:</label>
			     <input class="form-control" type="text" name="admission">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Completion Year:</label>
			     <input class="form-control" type="text" name="completion" >
     		</div>    		
     		<div class="form-group col-md-6">  	 	
			     <label> Gender:</label>
			 <div class="form-group col-md-4">  	 	
			     <input type="radio" name="gender" value="Male">   Male				 	
			     <input type="radio" name="gender" value="Female">  Female
			 </div>
     		</div>
     		
     	</div>
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Phone:</label>
			     <input class="form-control" type="text" name="phone">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Email Address:</label>
			     <input class="form-control" type="text" name="email" >
     		</div>
     	</div>
     	
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Physical Address:</label>
			     <input class="form-control" type="text" name="phisical" >
     		</div>
     		<div class="form-group col-md-6">
			     <label>Password:</label>
			     <input class="form-control" type="text" name="password">
     		</div>
     	</div>
     	
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Faculty:</label>
			     <select class="form-control" name="facult">
				<% for(Faculty flt:list){ %>
				<option><%= flt.getFacultyCode() %></option>
				<%} %>
				</select>
     		</div>
     		<div class="form-group col-md-6">
			     <label>Enrolling:</label>
			     <input class="form-control" type="text" name="enrolling">
     		</div>
     	</div>
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	
     	<input class="btn btn-success" type="submit" name="save_user" value="SAVE">
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>