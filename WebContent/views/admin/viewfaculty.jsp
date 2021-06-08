<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.FacultyDb" %>
	<%@ page import="com.suza.model.Faculty" %>
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
	<h1 class="text-center">List of Faculties</h1>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Faculty Code</th>
				<th>Faculty Name</th>
				<th>Duration</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
			<% for(Faculty flt:list){ %>
			<tr>
				<td><%= flt.getFacultyCode() %></td>
				<td><%= flt.getFacultyName() %></td>
				<td><%= flt.getDuration() %></td>
				<td><a href="../../DeleteFaculty?flt_code=<%= flt.getFacultyCode() %>">Delete</a></td>
				<td><a href="updatefaculty.jsp?flt_code=<%= flt.getFacultyCode() %>">Update</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>