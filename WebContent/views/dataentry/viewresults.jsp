<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.ResultsDb" %>
	<%@ page import="com.suza.model.Results" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%
		List<Results> list=ResultsDb.getAllResults();
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavDEntry.jsp" %>
<div class="content">		
	<h1 class="text-center">Student's Results</h1>
	
	<div class="table-responsive">
	<table class="table table-striped table-sm table-bordered">
		<thead>
			<tr>
				<th>Sn</th>
				<th>Registration No</th>
				<th>Student Name</th>
				<th>Enroll</th>
				<th>Course Code</th>
				<th>Course Name</th>
				<th>Semester</th>
				<th>Year</th>
				<th>Category</th>
				<th>Credit</th>
				<th>CW</th>
				<th>FE</th>
				<th>Total</th>
				<th>Grade</th>
			</tr>
		</thead>
		<tbody>
			<% 
				int i =1;
				for(Results rslt:list){ %>
			<tr>
				<td><%= i %> <% i++; %></td>
				<td><%= rslt.getRegNo() %></td>
				<td><%= rslt.getFirstName()+" "+rslt.getLastName() %></td>
				<td><%= rslt.getEnroll() %></td>
				<td><%= rslt.getCourseCode() %></td>
				<td><%= rslt.getCourseName() %></td>
				<td><%= rslt.getSemester() %></td>
				<td><%= rslt.getYear() %></td>
				<td><%= rslt.getCategory() %></td>
				<td><%= rslt.getCredit() %></td>
				<td><%= rslt.getCoursework() %></td>
				<td><%= rslt.getFinalexam() %></td>
				<td><%= rslt.getTotal() %></td>
				<td><%
					double t =  rslt.getTotal();
					if(t >= 70){
						out.print('A');
						
					}else if(t<70 && t>=60){
						out.print("B+");
						
					}else if(t<60 && t>=50){
						out.print('B');
						
					}else if(t<50 && t>=40){
						out.print('C');
						
					}else if(t<40 && t>=30){
						out.print('D');
						
					}else if(t<30){
						out.print('F');
					}
					
				%></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	</div>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>
