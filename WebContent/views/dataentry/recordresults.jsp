<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.StudentDb, com.suza.db.CourseDb" %>
	<%@ page import="com.suza.model.Student, com.suza.model.Course" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavDEntry.jsp" %>
	<%
		String enroll = request.getParameter("enroll");
		String course = request.getParameter("course");
	 	List<Student> list=StudentDb.getAllStudentEnroll(enroll);
	 	
	 	List<Course> listc=CourseDb.getAllCourse();
	%>
<div class="content">
<h1 class="text-center">Result Form</h1>	
<form action="../../SaveResult" method="POST" name="myForm" class="form">
	
	<div class ="row form-horizontal">
     		<div class="form-group col-md-3">  	 	
			     <label> Result Date:  <span class="text-danger">*</span></label>
			     <input class="form-control" type="date" name="rst_date" >
     		</div>
     		<div class="form-group col-md-3">  	 	
			     <label> Course:</label>
			     <input class="form-control" name="course" value="<%= course %>" readonly>	
     		</div>
     		<input  type="hidden" name="recorder" value="<%= recorder %>" >
     	</div>
     	
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-3">  	 	
			     <label> Registration Number:</label>
     		</div>
     		<div class="form-group col-md-4">  	 	
			     <label>Full Name:</label>
			</div>
     		<div class="form-group col-md-5">  	 	
			     <label> Score: <span class="text-danger">*</span></label>
     		</div>
     	</div>
     	
	<%	
		for(Student std:list){ %>
		<div class ="row form-horizontal">
       	 	<div class="form-group col-md-3">
			     <input class="form-control" type="text" name="regNo" value="<%= std.getReg() %>" readonly>
     		</div>
     		<div class="form-group col-md-4">
			     <input class="form-control" type="text" name="full_name" value="<%= std.getFirstname()+" "+std.getMiddlename()+" "+std.getLastname() %>" readonly>
     		</div>
     		<div class="form-group col-md-5">  	 	
			     <div class="form-group col-md-4">
			     	 <input class="form-control" type="text" name="score" autocomplete="off">
			     </div>
     		</div>
     	</div>
	<% } %>
	
	<input class="btn btn-success" type="submit" value="Record">
</form>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>