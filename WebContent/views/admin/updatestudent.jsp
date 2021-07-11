<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.StudentDb, com.suza.model.Student" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>

	<%
		String reg_no =request.getParameter("reg");	
		Student std=StudentDb.getStudentById(reg_no);
	%>

	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Update Student's Form</h1>
	
	<form action="../../UpdateStudent" method="POST" name="myForm" class="form">
	
		<input type="hidden" name="reg_no" value="<%=std.getReg() %>">
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> First Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="fname" value="<%=std.getFirstname() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Middle Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="mname" value="<%=std.getMiddlename() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Last Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="lname" value="<%=std.getLastname() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Date of Birth: <span class="text-danger">*</span></label>
			     <input class="form-control" type="date" name="dob" value="<%=std.getDob() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Admission Year: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="admission" value="<%=std.getAdmissionYear() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Completion Year: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="completion" value="<%=std.getComplitionYear() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Gender:</label>
			 <div class="form-group col-md-4">  	 	
			     <input type="radio" name="gender" value="Male" checked>   Male				 	
			     <input type="radio" name="gender" value="Female">  Female
			 </div>
     		</div>
       	 	<div class="form-group col-md-6">  	 	
			     <label> Phone: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="phone" value="<%=std.getPhone() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Email:</label>
			     <input class="form-control" type="text" name="email" value="<%=std.getEmail() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Physical Address:</label>
			     <input class="form-control" type="text" name="physical" value="<%=std.getPhisical() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Password: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="password" value="<%=std.getPassword() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Faculty: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="facult" value="<%=std.getFacult() %>">
     		</div>
     	</div>
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Enrolling: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="enrolling" value="<%=std.getEnrolled() %>">
     		</div>
     	</div>
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	
     	<input class="btn btn-success" type="submit" value="Update">
     	<a href="viewstudents.jsp" class="btn btn-danger">Cancel</a>
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>