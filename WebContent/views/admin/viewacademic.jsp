<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*, java.text.*, java.time.*" %>
	<%@ page import="com.suza.db.EmployeeDb, com.suza.model.Employee" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%
		List<Employee> list=EmployeeDb.getAllEmployee();
	
		String successMessage = request.getParameter("success");
		String success;
		if(successMessage == null){
			success = " ";
		}else{
			success = successMessage;
		}
		
		String errorMessage = request.getParameter("error");
		String error;
		if(errorMessage == null){
			error = " ";
		}else{
			error = errorMessage;
		}
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">
	<h5 class="text-success"><%= success %></h5>
	<h5 class="text-danger"><%= error %></h5>	
	<div class ="row form-horizontal">
	<div class="col-md-3">
		<form action="#" method="post">
			<input id="search" type="text" placeholder="Search..." autocomplete="off">
		</form>
	</div>
	<div class="col-md-6">	
		<h1 class="text-center">List of Employees</h1>
	</div>
	<div class="col-md-3">
		<input type="button" value="Print" onclick="printReport()" >
	</div>
</div>
	<div id="report">
	<div class="table-responsive">
	<table class="table table-striped table-sm table-bordered">
		<thead>
			<tr>
				<th>Sn</th>
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
				<th colspan="2">Actions</th>
			</tr>
		</thead>
		<tbody id="tableData">
			<%
				int i=1;
				for(Employee emp:list){
			%>
			<tr>
				<td><%= i %> <% i++; %></td>
				<td><%= emp.getId() %></td>
				<td><%= emp.getFirstName() %></td>
				<td><%= emp.getMiddleName() %></td>
				<td><%= emp.getLastName() %></td>
				<td><% 
					String date1= emp.getDob();
					Date date = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
					Calendar c = Calendar.getInstance();
					c.setTime(date);
					int year = c.get(Calendar.YEAR);
					int month = c.get(Calendar.MONTH);
					int day = c.get(Calendar.DATE);
					LocalDate dob = LocalDate.of(year, month, day);
					Period diff = Period.between(dob, now);
					int age = diff.getYears();
					
					out.print(age);
				%></td>
				<td><%= emp.getQualification() %></td>
				<td><%= emp.getPhone() %></td>
				<td><%= emp.getEmail() %></td>
				<td><%= emp.getGender() %></td>
				<td><%= emp.getPassword() %></td>
				<td><%= emp.getRoll() %></td>
				<td><%= emp.getDepartment() %></td>
				<td><%= emp.getPhisical() %></td>
				<td><a class="btn btn-danger" href="../../DeleteEmployee?id=<%= emp.getId() %>"><i class="fa fa-trash" ></i></a></td>
				<td><a class="btn btn-primary" href="updateacademic.jsp?id=<%= emp.getId() %>"><i class="fa fa-edit"></i></a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	</div>
	</div>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>