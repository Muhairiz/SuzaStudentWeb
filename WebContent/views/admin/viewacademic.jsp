<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.EmployeeDb, com.suza.model.Employee" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%
		List<Employee> list=EmployeeDb.getAllEmployee();
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">List of Staff</h1>
	
	<div class="table-responsive">
	<table class="table table-striped table-sm table-bordered">
		<thead>
			<tr>
				<th>Staff No</th>
				<th>First</th>
				<th>Middle</th>
				<th>Last</th>
				<th>Age</th>
				<th>Qualification</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Password</th>
				<th>Roll</th>
				<th>Department</th>
				<th>Address</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
			<% for(Employee emp:list){ %>
			<tr>
				<td><%= emp.getId() %></td>
				<td><%= emp.getFirstName() %></td>
				<td><%= emp.getMiddleName() %></td>
				<td><%= emp.getLastName() %></td>
				<td><%= emp.getDob() %></td>
				<td><%= emp.getQualification() %></td>
				<td><%= emp.getPhone() %></td>
				<td><%= emp.getEmail() %></td>
				<td><%= emp.getGender() %></td>
				<td><%= emp.getPassword() %></td>
				<td><%= emp.getRoll() %></td>
				<td><%= emp.getDepartment() %></td>
				<td><%= emp.getPhisical() %></td>
				<td><a href="../../DeleteEmployee?id=<%= emp.getId() %>">Delete</a></td>
				<td><a href="updateacademic.jsp?id=<%= emp.getId() %>">Update</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	</div>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>