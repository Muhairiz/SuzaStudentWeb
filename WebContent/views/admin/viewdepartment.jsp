<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.DepartmentDb" %>
	<%@ page import="com.suza.model.Department" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%
		List<Department> list=DepartmentDb.getAllDepartment();
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">
<div class ="row form-horizontal">
	<div class="col-md-3">
		<form action="#" method="post">
			<input id="search" type="text" placeholder="Search..." autocomplete="off">
		</form>
	</div>
	<div class="col-md-6">	
		<h1 class="text-center">List of Departments</h1>
	</div>
	<div class="col-md-3">
		<input type="button" value="Print" onclick="printReport()" >
	</div>
</div>	
	<div id="report">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Department Code</th>
				<th>Department Name</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody id="tableData">
			<% for(Department dep:list){ %>
			<tr>
				<td><%= dep.getDepCode() %></td>
				<td><%= dep.getDepName() %></td>
				<td><a href="../../DeleteDepartment?dep_code=<%= dep.getDepCode() %>">Delete</a></td>
				<td><a href="updatedepartment.jsp?dep_code=<%= dep.getDepCode() %>">Update</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	</div>
</div>

<%@ include file="../../includes/scripts.jsp" %>
<%@ include file="../../includes/footer.jsp"%>
</body>
</html>