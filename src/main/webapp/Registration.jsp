<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>The Recipe Store - Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
    	html {
    		height: 100%;
    		width: 100%;
    	}
    
        body {
            padding-top: 70px;
            padding-bottom: 20px;
        }
        
        body {
			background: linear-gradient(315deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
			background-repeat: no-repeat;
			background-size: cover;
        }        
        
		.navbar-custom {
		    background-color: #4CAF50; /* Greenish color */
		}            
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .form-group input[type="email"],
        .form-group input[type="text"],
        .form-group input[type="password"] {
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }
        
        .form-group input[type="submit"] {
            padding: 10px;
            border-radius: 3px;
            border: none;
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }
        
	    .footer {
	        position: fixed;
	        bottom: 0;
	        width: 100%;
	        height: 50px; /* Adjust as needed */
	        background-color: #f1f1f1;
	        text-align: center;
	        line-height: 50px;
	    }        
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
        <a class="navbar-brand" href="#">Recipe Store</a>
    </nav>

    <div class="container">
        <h1>Register</h1>
        <form method="POST" action="Register">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>           
            <div class="form-group">
                <input type="submit" value="Register" class="btn btn-primary">
            </div>
        </form>
        
        <div class="text-center">
            <p>Already a member? <a href="Login.jsp">Login here</a></p>
        </div>            
    </div>
    
    <div class="footer">
        Made with Love, by CSE B - 2024
    </div>    

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
