<%@ page import="java.util.*" %>
	<%@ page import="java.util.*, java.text.*, java.time.*" %>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="../../bootstrap/js/jquery-2.1.4.min.js"></script>
	<script src="../../bootstrap/js/myFunctions.js"></script>
	<script src="../../bootstrap/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="../../bootstrap/jquery-validation/dist/additional-methods.min.js"></script>
	<link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="../../bootstrap/css/styles.css">
	<link rel="stylesheet" href="../../bootstrap/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../bootstrap/css/font-awesome.css">
	<title>Suza Students App</title>
	
	<%
		session =request.getSession(false);
		String first =(String)session.getAttribute("fname");
		String last =(String)session.getAttribute("lname");
		String recorder =(String)session.getAttribute("id_no");
		String myRoll =(String)session.getAttribute("roll");
		
		LocalDate now = LocalDate.now();
		int currentYear = now.getYear();
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		
		if(first==null){
			response.sendRedirect("../../login.jsp");
		}
		
	%>
		
</head>