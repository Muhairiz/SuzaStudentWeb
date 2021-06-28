<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.CourseAssignDb, com.suza.model.CourseAssign" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>

	<%
		String id=request.getParameter("id");	
		CourseAssign crsa=CourseAssignDb.getAssignedById(id);
	%>

	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Update Course Assigned Form</h1>
	
	<form action="../../UpdateEmployee" method="POST" class="form">
	
		<input type="hidden" name="id" value="<%=crsa.getId() %>">
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Course Code:</label>
			     <input class="form-control" type="text" name="c_code" value="<%=crsa.getCourse() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Academic Staff:</label>
			     <input class="form-control" type="text" name="staff" value="<%=crsa.getEmployee() %>">
     		</div>
     	</div>
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Faculty:</label>
			     <input class="form-control" type="text" name="faculty" value="<%=crsa.getFaculty() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Recorder:</label>
			    <input class="form-control" type="text" name="recorder" value="<%=recorder %>" readonly>
     		</div>
     	</div>
     	
     	<input class="btn btn-success" type="submit" value="Update">
     	<a href="viewcourseassign.jsp" class="btn btn-danger">Cancel</a>
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>