<div class="header" id="headerNav">
	<a id="logo-img" href="" class="pull-left img-rounded">
	    <img alt="" src="../../images/">
	</a>
	<div class="navbar-brand">
		<h1>Suza Student App</h1>
	</div>
	  
	<div class="navbar-brand">
		<form action="#" method="post">
			<input type="text" name="search" placeholder="Search...">
			<button class="btn btn-success" type="submit">Search</button>
		</form>
	</div>

	<a href="../../Logout">
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
</script>