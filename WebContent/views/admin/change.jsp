<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ include file ="../../includes/head.jsp" %>
<body>

	<%
		String param = request.getParameter("error");
		String display;
		
		if(param == null){
			display = " ";
		}else{
			display = param;
		}
		
	%>

	<%@ include file="../../includes/header.jsp" %>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
<div class="content">		
	<h1 class="text-center">Change Password</h1>
	
	<form action="../../ChangePassword" method="POST" name="myForm" class="form">
		<input class="form-control" type="hidden" name="id" value="<%= recorder%>">
		<div class ="row form-horizontal">
				<div class="form-group col-md-3">  	 	
				     <label>Current Password: <span class="text-danger">*</span></label>
				     <input class="form-control" type="text" name="password" placeholder="Enter current password">
	     		</div>
	     		<div class="form-group col-md-3">  	 	
				     <label> New Password:  <span class="text-danger">*</span></label>
				     <input id="newpass" class="form-control" type="password" name="newPass" placeholder="Enter new password">
	     		</div>
	     		<div class="form-group col-md-3">  	 	
				     <label> Confirm Password:</label>
				     <input id="confpass" class="form-control" type="password" name="confpass" placeholder="Confirm your password">
	     		</div>
	    </div>
	    <div id="display" class="text-danger"><%=display %></div>
		<input class="btn btn-success" type="submit" value="Change">
	</form>
	
</div>
<%@ include file="../../includes/footer.jsp"%>
</body>
</html>