<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>login page</title>
<script src="bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="bootstrap/js/myFunctions.js"></script>
<script src="bootstrap/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="bootstrap/jquery-validation/dist/additional-methods.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
    <body>
    <%
		String errorMessage = request.getParameter("error");
		String error;
		
		if(errorMessage == null){
			error = " ";
		}else{
			error = errorMessage;
		}
	%>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                        <h3 class="text-center font-weight-light my-4"> Login Page</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action="Login" method="post" name="myForm">
                                            <div class="form-group">
                                                <label class="large">Username</label>
                                                <input class="form-control py-3" type="text" name="username" placeholder="Enter Username" autocomplete="off" />
                                            </div>
                                            <div class="form-group">
                                                <label class="large">Password</label>
                                                <input class="form-control py-3" type="password" name="pass" placeholder="Enter password" />
                                            </div>
                                            <p class="text-center text-danger"><%= error %></p>
                                            <div class="form-group mt-4 mb-0">
                                                <button class="btn btn-success btn-block">Login</button>
                                            </div>
                                        </form>
                                    </div>
                                    
                                </div>
                                <div class="text-center" id="forget">
                                <a href="#">Forget password?</a></div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
