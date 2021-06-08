<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.StudentDb" %>
	<%@ page import="com.suza.model.Student" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%
		List<Student> list=StudentDb.getAllStudent();
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">List of Students</h1>
	
	<div class="table-responsive">
	<table class="table table-striped table-sm table-bordered">
		<thead>
			<tr>
				<th>Reg No</th>
				<th>First</th>
				<th>Middle</th>
				<th>Last</th>
				<th>Age</th>
				<th>Admission</th>
				<th>Completion</th>
				<th>Gender</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Address</th>
				<th>Password</th>
				<th>Faculty</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
			<% for(Student stl:list){ %>
			<tr>
				<td><%= stl.getReg() %></td>
				<td><%= stl.getFirstname() %></td>
				<td><%= stl.getMiddlename() %></td>
				<td><%= stl.getLastname() %></td>
				<td><%= stl.getDob() %></td>
				<td><%= stl.getAdmissionYear() %></td>
				<td><%= stl.getComplitionYear() %></td>
				<td><%= stl.getGender() %></td>
				<td><%= stl.getPhone() %></td>
				<td><%= stl.getEmail() %></td>
				<td><%= stl.getPhisical() %></td>
				<td><%= stl.getPassword() %></td>
				<td><%= stl.getFacult() %></td>
				<td><a href="../../DeleteStudent?reg=<%= stl.getReg() %>">Delete</a></td>
				<td><a href="updatestudent.jsp?reg=<%= stl.getReg() %>">Update</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	</div>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>