	function printReport(){
		var report = document.getElementById("report").innerHTML;
		var obj = window.open('', '', 'height=500, width=500');
		obj.document.write('<html> <body>');
		obj.document.write(report);
		obj.document.write('</html> </body>');
		obj.document.close();
		obj.print();
	};
	
	$(document).ready(function(){
		  $("#search").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#tableData tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	
		
	//SIDE NAVE//
		
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
	};
	
	
	function logout(){
		var retVal = confirm("Are you sure! Do you want to Logout?");
		if(retVal == true){
			return true;
		}else{
			return false;
		}
	};
	
	//FORM VALIDATION
$().ready(function(){
	$("form[name= 'myForm']").validate({
		rules: {
			fname: {
				required: true,
				pattern: "^[a-zA-Z_]*$",
			},
			lname: {
				required: true,
				pattern: "^[a-zA-Z_]*$",
			},
			mname: {
				required: true,
				pattern: "^[a-zA-Z_]*$",
			},
			c_name: {
				required: true,
				pattern: "^[a-zA-Z_ ]*$",
			},
			
			flt_name: {
				required: true,
				pattern: "^[a-zA-Z_ ]*$",
			},
			
			emp_no: {
				required: true,
			},
			
			phone: {
				required: true,
				pattern: "[0-9]{10}",
			},
			
			admission: {
				required: true,
				pattern: "[0-9]{4}",
			},
			
			academic: {
				required: true,
				pattern: "[0-9]{4}",
			},
			
			completion: {
				required: true,
				pattern: "[0-9]{4}",
			},
			credit: {
				required: true,
				pattern: "[0-9]+",
			},
			
			password: {
				required: true,
				minlength: 5,
			},
			
			semester: {
				required: true,
				pattern: "[1-2]{1}",
			},
			
			enrolling: {
				required: true,
			},
			
			email: {
				email: true,
			},
			
			emailS: {
				required: true,
				email: true,
			},
			
			dob: {
				required: true,
			},
			facult: "required",
			qualification: "required",
			username: "required",
			pass: "required",
			reg_no: "required",
			dep_name: "required",
			dep_code: "required",
			c_code: "required",
			duration: "required",
			category: "required",
			flt_code: "required",
			week: "required",
			status: "required",
			att_date: "required"
		},
		
		
		messages: {
			fname: {
				required: "please enter the firstname",
				pattern: "name must be contain alphabet only"
			},
			lname: {
				required: "please enter the lastname",
				pattern: "name must be contain alphabet only"
			},
			mname: {
				required: "please enter the middlename",
				pattern: "name must be contain alphabet only"
			},
			
			c_name: {
				required: "please enter course name",
				pattern: "invalid course name format",
			},
			
			flt_name: {
				required: "please enter faculty name",
				pattern: "invalid facult name format",
			},
			
			emp_no: {
				required: "please enter the Employee ID",
			},
			
			phone: {
				required: "please enter Phone number",
				pattern: "invalid phone number"
			},
			
			semester: {
				required: "please provide semester",
				pattern: "invalid semester number"
			},
			
			email:{
				email:  "invalid email address",
			},
			
			emailS:{
				email:  "invalid email address",
				required: "please enter email address"
			},
			
			dob:{
				required:  "please enter date of birth",
			},
			
			admission: {
				required: "please enter addmission year",
				pattern: "invalid year format",
			},
			completion: {
				required: "please enter addmission year",
				pattern: "invalid year format",
			},
			academic: {
				required: "please enter academic year",
				pattern: "year must be contain 4 numbers",
			},
			
			credit: {
				required: "please enter course credit",
				pattern: "invalid credit format",
			},
			
			enrolling: {
				required: "please enter the enrollment",
			},
			
			password: {
				required: "please enter password",
				minlength: "pasword must be contain atleat 5 characters",		
			},
			
			username: "please enter username",
			reg_no: "please enter registration number",
			pass: "please enter password",
			qualification: "please enter qualification",
			facult: "please enter facult",
			dep_name: "please enter department name",
			dep_code: "please enter department code",
			c_code: "please enter course code",	
			duration: "please enter course duration",
			category: "please enter course category",	
			flt_code: "please enter faculty code",
			week: "please enter week number",
			status: "please provide status",
			att_date: "please provide a date"
		},
		
		submitHandler: function(form){
			form.submit();
		}
	});
});
	
	
	
	
	
	
	
	
	
	
	
	
	
	