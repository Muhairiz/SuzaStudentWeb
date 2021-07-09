<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
	<%@ page import="com.suza.db.DepartmentDb" %>
	<%@ page import="com.suza.model.Department" %>
<!DOCTYPE html>
<html>
	<%@ include file="../../includes/head.jsp" %>
<body>
	<%
		List<Department> list=DepartmentDb.getAllDepartment();
	
		String errorMessage = request.getParameter("error");
		String error;
		
		if(errorMessage == null){
			error = " ";
		}else{
			error = errorMessage;
		}
		
		String successMessage = request.getParameter("success");
		String success;
		if(successMessage == null){
			success = " ";
		}else{
			success = successMessage;
		}
		
	%>
	<%@ include file="../../includes/sidenavAdmin.jsp" %>
	<%@ include file="../../includes/header.jsp" %>	
	
<div class="content">
 <h5 class="text-danger"><%= error %></h5>
 <h5 class="text-success"><%= success %></h5>
	 <h1 class="text-center">Staff Registration Form</h1>	
	 
	 <form name="myForm" action="../../SaveEmployee" method="POST">	
       	 <div class ="row form-horizontal">
       	 	<div class="form-group col-md-6">  	 	
			     <label> Employee ID: <span class="text-danger text-lg">*</span></label>
			     <input class="form-control" type="text" name="emp_no" autocomplete="off">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>First Name: <span class="text-danger text-lg">*</span></label>
			     <input class="form-control" type="text" name="fname" id="fname" autocomplete="off">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Middle Name: <span class="text-danger text-lg">*</span></label>
			     <input class="form-control" type="text" name="mname" autocomplete="off">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Last Name: <span class="text-danger text-lg">*</span></label>
			     <input class="form-control" type="text" name="lname" autocomplete="off">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Date of Birth:</label>
			     <input class="form-control" type="date" name="dob">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Qualification: <span class="text-danger text-lg">*</span></label>
			     <input class="form-control" type="text" name="qualification" autocomplete="off">
     		</div>
     	</div>
     	
     	<div  class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label> Phone: <span class="text-danger text-lg">*</span></label>
			     <input class="form-control" type="text" name="phone" autocomplete="off">
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label>Email Address: <span class="text-danger text-lg">*</span></label>
			     <input class="form-control" type="text" name="emailS" autocomplete="off">
     		</div>
     	</div>
     	<div  class ="row form-horizontal">
			<div class="form-group col-md-6">  	 	
			     <label> Gender:</label>
			 <div class="form-group col-md-4">  	 	
			     <input type="radio" name="gender" value="Male" checked>   Male				 	
			     <input type="radio" name="gender" value="Female">  Female
			 </div>
     		</div>
     		<div class="form-group col-md-6">  	 	
			     <label> Password: <span class="text-danger text-lg">*</span></label>
			     <input class="form-control" type="password" name="password" autocomplete="off">
     		</div>
     	</div>
     	
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Roll:</label>
			     <select class="form-control" name="roll">
			     	<option value="staff">Staff</option>
			     	<option value="admin">Admin</option>
			     	<option value="data entry">Data Entry</option>
			     </select>
     		</div>
     		<div class="form-group col-md-6">
			     <label>Department:</label>
			     <select class="form-control" name="department">
				<% for(Department dep:list){ %>
				<option><%= dep.getDepCode() %></option>
				<%} %>
				</select>
     		</div>
     	</div>
     	<div class ="row form-horizontal">
     		<div class="form-group col-md-6">  	 	
			     <label>Physical Address:</label>
			     <input class="form-control" type="text" name="phisical" autocomplete="off">
     		</div>
     	</div>
     	<input class="form-control" type="hidden" name="recorder" value="<%=recorder %>">
     	
     	<button class="btn btn-success" type="submit">SAVE</button>
    </form>	
</div>
	 
<%@ include file="../../includes/footer.jsp"%>
</body>
</html>