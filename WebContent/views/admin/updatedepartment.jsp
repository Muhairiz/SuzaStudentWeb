<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="com.suza.db.DepartmentDb" %>
	<%@ page import="com.suza.model.Department" %>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>

	<%
		String dep_code=request.getParameter("dep_code");	
	    Department dep=DepartmentDb.getDepartmentById(dep_code);
	%>

	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Update Department Form</h1>
	
	<form action="../../UpdateDepartment" method="POST" name="myForm" class="form">
	
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Department Code:</label>
			     <input class="form-control" type="text" name="dep_code" value="<%=dep.getDepCode()%>" readonly>
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Department Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="dep_name" value="<%=dep.getDepName() %>" autocomplete="off">
     		</div>
     	</div>
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	<input class="btn btn-success" type="submit" value="Update">
     	<a href="viewdepartment.jsp" class="btn btn-danger">Cancel</a>
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>