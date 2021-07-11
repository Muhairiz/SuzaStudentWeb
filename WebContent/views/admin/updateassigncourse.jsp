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
	
	<form action="../../UpdateAssigned" method="POST" name="myForm" class="form">
	
		<input type="hidden" name="id" value="<%=crsa.getId() %>">
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">	
			     <label> Course Code: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="c_code" value="<%=crsa.getCourse() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Academic Staff: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="staff" value="<%=crsa.getEmployee() %>">
     		</div>
     	</div>
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Faculty: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="facult" value="<%=crsa.getFaculty() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Enrollment: <span class="text-danger">*</span></label>
			    <input class="form-control" type="text" name="enrolling" value="<%=crsa.getEnroll() %>">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Academic Year: <span class="text-danger">*</span></label>
			    <input class="form-control" type="text" name="academic" value="<%=crsa.getYear() %>">
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