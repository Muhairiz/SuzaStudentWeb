<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Faculty Registration Form</h1>
	
	<form action="../../SaveFaculty" method="POST" name="myForm" class="form">	
       	 <div class ="row form-horizontal">
       	 	<div class="form-group col-md-4">  	 	
			     <label> Faculty Code: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="flt_code">
     		</div>
     		<div class="form-group col-md-4">  	 	
			     <label> Faculty Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="flt_name">
     		</div>
     		<div class="form-group col-md-4">  	 	
			     <label> Duration: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="duration">
     		</div>
     	</div>   	
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	<input class="btn btn-success" type="submit" value="SAVE">
     	<input class="btn btn-danger" type="reset" value="RESET">
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp"%>
</body>
</html>