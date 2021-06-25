<script type="text/javascript">
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
	
	$("#button").click(function(){		
		  $("#table2excel").table2excel({
		    // exclude CSS class
		    exclude:".noExl",
		    name:"Worksheet Name",
		    filename:"SomeFile",//do not include extension
		    fileext:".xls" // file extension
		  });
		});
		
</script>