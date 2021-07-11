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
	
	<form name="myForm" action="../../SaveStudent" method="POST" class="form">	
       	 <div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Registration Number: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="reg_no" autocomplete="off">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>First Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="fname" autocomplete="off">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Middle Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="mname" autocomplete="off">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Last Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="lname" autocomplete="off" >
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Date of Birth: <span class="text-danger">*</span></label>
			     <input class="form-control" type="date" name="dob" >
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Admission Year: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="admission" autocomplete="off">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Completion Year: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="completion" autocomplete="off">
     		</div>    		
     		<div class="form-group col-md-6">  	 	
			     <label> Gender:</label>
			 <div class="form-group col-md-4">  	 	
			     <input type="radio" name="gender" value="Male" checked>   Male				 	
			     <input type="radio" name="gender" value="Female">  Female
			 </div>
     		</div>
     		
     	</div>
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Phone: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="phone" autocomplete="off">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Email Address:</label>
			     <input class="form-control" type="text" name="email" autocomplete="off">
     		</div>
     	</div>
     	
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Physical Address:</label>
			     <input class="form-control" type="text" name="phisical" autocomplete="off">
     		</div>
     		<div class="form-group col-md-6">
			     <label>Password: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="password" autocomplete="off">
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
			     <label>Enrolling: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="enrolling" autocomplete="off">
     		</div>
     	</div>
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	
     	<input class="btn btn-success" type="submit" name="save_user" value="SAVE">
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>