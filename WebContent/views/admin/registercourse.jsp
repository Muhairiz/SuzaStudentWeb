<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>
	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Course Registration Form</h1>
	
	<form action="../../SaveCourse" method="POST" name="myForm" class="form">
		
       	 <div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label>Course Code: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="c_code">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Course Name: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="c_name">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Semester: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="semester">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Academic Year: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="academic" >
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Duration: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="duration" >
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Category: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="category">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Credit: <span class="text-danger">*</span></label>
			     <input class="form-control" type="text" name="credit" >
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Recorder:</label>
			    <input class="form-control" type="text" name="recorder" value="<%=recorder %>" readonly>
     		</div>
     	</div>
     	    	
     	<input class="btn btn-success" type="submit" name="save_user" value="SAVE">
    </form>	
	
</div>

<%@ include file="../../includes/footer.jsp" %>
</body>
</html>