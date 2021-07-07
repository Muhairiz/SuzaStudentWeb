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
	 	List<Student> list=StudentDb.getAllStudentEnroll(enroll);
	 	
	 	 List<CourseAssign> listc=CourseAssignDb.getAssignedByStaff(recorder);
	%>
<div class="content">
<h1>Attendance Form</h1>	
<form action="../../RecordAttendance" method="POST" class="form">
	
	<div class ="row form-horizontal">
			<div class="form-group col-md-3">  	 	
			     <label> Week:</label>
			     <input class="form-control" type="number" min=1 max=20 name="week">
     		</div>
     		<div class="form-group col-md-3">  	 	
			     <label> Attendance Date:</label>
			     <input class="form-control" type="date" name="att_date" >
     		</div>
     		<div class="form-group col-md-3">  	 	
			     <label> Course:</label>
			     <select class="form-control" name="course">
					<% for(CourseAssign crsa:listc){ %>
						<option><%= crsa.getCourse() %></option>
					<%} %>
				</select>
     		</div>
     		<input  type="hidden" name="recorder" value="<%= recorder %>" >
     	</div>
	<%
		for(Student std:list){ %>
		<div class ="row form-horizontal">
       	 	<div class="form-group col-md-3">  	 	
			     <label> Registration Number:</label>
			     <input class="form-control" type="text" name="regNo" value="<%= std.getReg() %>" readonly>
     		</div>
     		<div class="form-group col-md-4">  	 	
			     <label>Full Name:</label>
			     <input class="form-control" type="text" name="fname" value="<%= std.getFirstname()+" "+std.getMiddlename()+" "+std.getLastname() %>" readonly>
     		</div>
     		<div class="form-group col-md-5">  	 	
			     <label> Status:</label>
			     <div class="form-group col-md-4">
			     	<input type="checkbox" name="status" value="Attend"> Attend    
			     	<input type="checkbox" name="status" value="Absent"> Absent
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