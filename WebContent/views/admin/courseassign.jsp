<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.suza.db.FacultyDb, com.suza.db.EmployeeDb, com.suza.db.CourseDb" %>
	<%@ page import="com.suza.model.Faculty, com.suza.model.Employee, com.suza.model.Course" %>
<!DOCTYPE html>
<html>
	<%@ include file="../../includes/head.jsp" %>
<body>
	<%
		List<Faculty> flist=FacultyDb.getAllFaculty();
		List<Employee> elist=EmployeeDb.getAllEmployee();
		List<Course> clist=CourseDb.getAllCourse();
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Course Assign Form</h1>
	
	<form action="../../SaveAssignCourse" method="POST" class="form">
		
       	 <div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label>Course Code:</label>
			     <select class="form-control" name="c_code">
				<% for(Course fct:clist){ %>
				<option><%= fct.getCourseCode() %></option>
				<%} %>
				</select>
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Academic Staff:</label>
			     <select class="form-control" name="staff">
				<% for(Employee fct:elist){ %>
				<option><%= fct.getId() %></option>
				<%} %>
				</select>
     		</div>
     	</div>
     	
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Faculty:</label>
			    <select class="form-control" name="faculty">
				<% for(Faculty fct:flist){ %>
				<option><%= fct.getFacultyCode() %></option>
				<%} %>
				</select>
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Enroll:</label>
			    <input class="form-control" type="text" name="enroll">
     		</div>
     	</div>
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Academic Year:</label>
			    <input class="form-control" type="text" name="year">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Recorder:</label>
			    <input class="form-control" type="text" name="recorder" value="<%=recorder %>" readonly>
     		</div>
     	</div>
     	    	
     	<input class="btn btn-success" type="submit" name="save_user" value="SAVE">
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp" %>
</body>
</html>