<div class="header" id="headerNav">
	<a id="logo-img" href="" class="pull-left img-rounded">
	    <img alt="" src="../../images/">
	</a>
	<div class="navbar-brand">
		<h1>Suza Student App</h1>
	</div>
	  
	<div class="navbar-brand">
		
	</div>

	<a href="../../Logout" onclick="warnig-alert('are You?');">
		<span class="navbar-brand" id="lg-out"><i class="fa fa-power-off"></i> Logout</span>
	</a>
</div>

<script>
	var headerNav = document.getElementById("headerNav");
	var sticky= headerNav.offsetTop;
	function myFunction(){
		if(window.pageYOffset >= sticky){
			headerNav.classList.add("sticky");
		}else{
			headerNav.classList.remove("sticky");
		}
	};
	
	$(function(){
		$("form[name= 'myForm']").validate({
			rules: {
				fname: "required",
				lname: "required",
			},
			
			messages: {
				fname: "Please enter fname",
				lname: "Please enter lname",
			},
			
			submitHandler: function(form){
				form.submit();
			}
		});
	});
	
	
</script>