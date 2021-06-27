<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="com.suza.db.CourseDb" %>
	<%@ page import="com.suza.model.Course" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>

	<%
		String crs_code=request.getParameter("crs_code");	
		Course crs=CourseDb.getCourseById(crs_code);															
	%>

	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Update Course Form</h1>
	
	<form action="../../UpdateCourse" method="POST" class="form">
	
		<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label>Course Code:</label>
			     <input class="form-control" type="text" name="c_code" value="<%=crs.getCourseCode() %>" readonly>
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Course Name:</label>
			     <input class="form-control" type="text" name="c_name" value="<%=crs.getCourseName() %>">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Semester:</label>
			     <input class="form-control" type="text" name="semester" value="<%=crs.getSemester() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Academic Year:</label>
			     <input class="form-control" type="text" name="academic" value="<%=crs.getAcademicYear() %>" >
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Duration:</label>
			     <input class="form-control" type="text" name="duration" value="<%=crs.getDuration() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Category:</label>
			     <input class="form-control" type="text" name="category" value="<%=crs.getCateory() %>">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Credit:</label>
			     <input class="form-control" type="text" name="credit" value="<%=crs.getCredit() %>">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Recorder:</label>
			    <input class="form-control" type="text" name="recorder" value="<%=recorder %>" readonly>
     		</div>
     	</div>
     	<input class="btn btn-success" type="submit" value="Update">
     	<a href="viewcourse.jsp" class="btn btn-danger">Cancel</a>
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>