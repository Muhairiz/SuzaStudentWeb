<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.CourseDb" %>
	<%@ page import="com.suza.model.Course" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%
		List<Course> list=CourseDb.getAllCourse();
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">List of Faculties</h1>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Course Code</th>
				<th>Course Name</th>
				<th>Semester</th>
				<th>Academic Year</th>
				<th>Duration</th>
				<th>Category</th>
				<th>Credit</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
			<% for(Course crs:list){ %>
			<tr>
				<td><%= crs.getCourseCode() %></td>
				<td><%= crs.getCourseName() %></td>
				<td><%= crs.getSemester() %></td>
				<td><%= crs.getAcademicYear() %></td>
				<td><%= crs.getDuration() %></td>
				<td><%= crs.getCateory() %></td>
				<td><%= crs.getCredit() %></td>
				<td><a href="../../DeleteFaculty?flt_code=<%= crs.getCourseCode() %>">Delete</a></td>
				<td><a href="updatefaculty.jsp?flt_code=<%= crs.getCourseCode() %>">Update</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>