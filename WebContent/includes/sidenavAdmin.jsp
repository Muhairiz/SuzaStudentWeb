<div class="sidenav">
	<a class="bg-success text-light" href="index.jsp"><i class="fa fa-home"></i>Home</a>
	<button class="dropdown-btn">
		<i class="fa fa-user"></i>Academic Staff <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="registeracademic.jsp"><i class="fa fa-user-plus"></i>Add Academic Staff</a>
		<a href="viewacademic.jsp"><i class="fa fa-binoculars"></i>Manage Academic Staff</a>
	</div> 
	
	<button class="dropdown-btn">
		<i class="fa fa-user"></i>Student <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="registerstudent.jsp"><i class="fa fa-user-plus"></i>Add Student</a>
		<a href="viewstudents.jsp"><i class="fa fa-binoculars"></i>Manage Student</a>
	</div>
	
	<button class="dropdown-btn">Department 
		<i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="registerdepartment.jsp"><i class="fa fa-plus-square"></i>Add Department</a>
		<a href="viewdepartment.jsp"><i class="fa fa-binoculars"></i>Manage Department</a>
	</div>
	 
	 <button class="dropdown-btn">Course 
	   <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
	  <a href="registercourse.jsp">Add Course</a>
	  <a href="viewcourse.jsp"><i class="fa fa-binoculars"></i>Manage Course</a>
	  <a href="courseassign.jsp">Course Assign</a>
	  <a href="viewcourseassign.jsp"><i class="fa fa-binoculars"></i>View Course Assign</a>
	</div>
	
	 <button class="dropdown-btn">Faculty 
	   <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
	  <a href="registerfaculty.jsp">Add Faculty</a>
	  <a href="viewfaculty.jsp"><i class="fa fa-binoculars"></i>Manage Faculty</a>
	</div>
	
	 <button class="dropdown-btn">Notice 
	   <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
	  <a href="notice.jsp">Add Notice</a>
	  <a href="viewnotice.jsp"><i class="fa fa-binoculars"></i>Manage Notice</a>
	</div>
	
	 <button class="dropdown-btn">PT Area 
	   <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
	  <a href="registerarea.jsp">Add PT Area</a>
	  <a href="viewarea.jsp"><i class="fa fa-binoculars"></i>Manage PT Area</a>
	</div> 
	<a class="text-light" href="change.jsp"><i class="fa fa-lock"></i>Change Password</a> 
</div>

<script type="text/javascript">
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;
for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
</script>


