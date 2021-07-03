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
	    List<CourseAssign> list=CourseAssignDb.getAssignedByStaff(recorder);
	%>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavStaff.jsp" %>
<div class="content">		
	
			<%
				for(CourseAssign crsa:list){ %>
				<a href="#" class="btn btn-primary btn-block"><% out.println(crsa.getCourse()); %></a><br>
			<% } %>
	
</div>
<%@ include file="../../includes/footer.jsp"%>
</body>
</html>