<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>login page</title>
<script src="bootstrap/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
    <body>
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
                                        <form action="Login" method="post">
                                            <div class="form-group">
                                                <label class="large">Username</label>
                                                <input class="form-control py-3" type="text" name="username" placeholder="Enter Username" />
                                            </div>
                                            <div class="form-group">
                                                <label class="large">Password</label>
                                                <input class="form-control py-3" type="password" name="password" placeholder="Enter password" />
                                            </div>
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
