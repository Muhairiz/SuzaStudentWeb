<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*, java.text.*, java.time.*" %>
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

	<form action="searchstudent.jsp" method="post">
		<input type="text" name="search" placeholder="Search...."><input type="submit" value="Search">
	</form>
		
	<h1 class="text-center">List of Students</h1>
	
	<div class="table-responsive">
	<table class="table table-striped table-sm table-bordered">
		<thead>
			<tr>
				<th>Sn</th>
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
				<th>Enrolled</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
			<% 
				int i=1;
				for(Student stl:list){ 
			%>
			<tr>
				<td><%= i %> <% i++; %></td>
				<td><%= stl.getReg() %></td>
				<td><%= stl.getFirstname() %></td>
				<td><%= stl.getMiddlename() %></td>
				<td><%= stl.getLastname() %></td>
				
				<td><% 
					String date1= stl.getDob();
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
				
				<td><%= stl.getAdmissionYear() %></td>
				<td><%= stl.getComplitionYear() %></td>
				<td><%= stl.getGender() %></td>
				<td><%= stl.getPhone() %></td>
				<td><%= stl.getEmail() %></td>
				<td><%= stl.getPhisical() %></td>
				<td><%= stl.getPassword() %></td>
				<td><%= stl.getFacult() %></td>
				<td><%= stl.getEnrolled() %></td>
				<td><a class="btn btn-danger" href="../../DeleteStudent?reg=<%= stl.getReg() %>">Delete</a></td>
				<td><a class="btn btn-primary" href="updatestudent.jsp?reg=<%= stl.getReg() %>">Update</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	</div>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>