<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="com.suza.db.FacultyDb" %>
	<%@ page import="com.suza.model.Faculty" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>

	<%
		String flt_code=request.getParameter("flt_code");	
	    Faculty flt=FacultyDb.getFacultyById(flt_code);															
	%>

	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Update Faculty Form</h1>
	
	<form action="../../UpdateFaculty" method="POST" name="myForm" class="form">
	
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-4">  	 	
			     <label> Faculty Code: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="flt_code" value="<%=flt.getFacultyCode() %>" readonly>
     		</div>
       	 	<div class="form-group col-md-4">  	 	
			     <label> Faculty Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="flt_name" value="<%=flt.getFacultyName() %>">
     		</div>
     		<div class="form-group col-md-4">  	 	
			     <label> Duration: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="duration" value="<%=flt.getDuration() %>">
     		</div>
     	</div>
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	<input class="btn btn-success" type="submit" value="Update">
     	<a href="viewfaculty.jsp" class="btn btn-danger">Cancel</a>
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>