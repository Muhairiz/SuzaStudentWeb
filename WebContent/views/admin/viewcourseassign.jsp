<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.CourseAssignDb" %>
	<%@ page import="com.suza.model.CourseAssign" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%
		List<CourseAssign> list=CourseAssignDb.getAllAssignedCourse();
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">List of Assigned Courses</h1>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Sn</th>
				<th>Course Code</th>
				<th>Academic Staff</th>
				<th>Faculty</th>
				<th>Enrolling</th>
				<th>Academic Year</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
			<% 
				int i =1;
				for(CourseAssign crsa:list){ %>
			<tr>
				<td><%= i %> <% i++; %></td>
				<td><%= crsa.getCourse() %></td>
				<td><%= crsa.getEmployee() %></td>
				<td><%= crsa.getFaculty() %></td>
				<td><%= crsa.getEnroll() %></td>
				<td><%= crsa.getYear() %></td>
				<td><a href="../../DeleteAssign?id=<%= crsa.getId() %>">Delete</a></td>
				<td><a href="updateassigncourse.jsp?id=<%= crsa.getId() %>">Update</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>