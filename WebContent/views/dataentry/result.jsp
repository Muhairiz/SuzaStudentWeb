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
	<%@ include file="../../includes/sidenavDEntry.jsp" %>
<div class="content">
	<h5 class="text-success"><%= success %></h5>
	<h5 class="text-danger"><%= error %></h5>	
	<%
		for(CourseAssign crsa:list){ %>
		<div  class ="row form-horizontal">
			<div class="form-group col-md-6">
				<a href="recordresults.jsp?enroll=<%= crsa.getEnroll()%>&course=<%= crsa.getCourse() %>" class="btn btn-primary btn-block"><% out.println(crsa.getCourse()); %></a>
			</div>
		</div> 
	<% } %>
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>