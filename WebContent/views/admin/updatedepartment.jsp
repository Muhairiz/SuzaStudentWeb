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
	
	<form action="../../UpdateDepartment" method="POST" class="form">
	
		<input type="hidden" name="dep_code" value="<%=dep.getDepCode()%>">
     	<div class ="row form-horizontal">
       	 	<div class="form-group col-lg-12 col-md-12">  	 	
			     <label> Department Name:</label>
			     <input class="form-control" type="text" name="dep_name" value="<%=dep.getDepName() %>">
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