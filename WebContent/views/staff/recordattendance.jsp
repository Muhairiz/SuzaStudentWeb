<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.StudentDb, com.suza.db.CourseAssignDb" %>
	<%@ page import="com.suza.model.Student, com.suza.model.CourseAssign" %>

<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavStaff.jsp" %>
	<%
		String enroll = request.getParameter("enroll");
		String course = request.getParameter("course");
	 	List<Student> list=StudentDb.getAllStudentEnroll(enroll);
	%>
<div class="content">
<h1>Attendance Form</h1>	
<form action="../../RecordAttendance" method="POST" name="myForm" class="form">
	
	<div class ="row form-horizontal">
			<div class="form-group col-md-3">  	 	
			     <label>Week: <span class="text-danger">*</span></label>
			     <input class="form-control" type="number" min=1 max=20 name="week">
     		</div>
     		<div class="form-group col-md-3">  	 	
			     <label> Attendance Date:  <span class="text-danger">*</span></label>
			     <input class="form-control" type="date" name="att_date" value="<%= now %>" readonly>
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
			     <label> Status: <span class="text-danger">*</span></label>
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
			     	Attend <input type="checkbox" name="status" value="Attend">     
			        Absent <input type="checkbox" name="status" value="Absent">
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