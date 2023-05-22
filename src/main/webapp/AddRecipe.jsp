<%
	if (session.getAttribute("uname") == null) {
		response.sendRedirect("Registration.jsp");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <title>The Recipe Store - Add Recipe</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
    	html {
    		min-height: 100%;
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
        
        .form-group input[type="text"],
        .form-group textarea {
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
	        position: static;
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
	    <a class="navbar-brand" href="Home.jsp">Recipe Store</a>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">

	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="#">Logout</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="#">Profile</a>
	            </li>
	        </ul>
	    </div>
	</nav>

    <div class="container mb-5">
        <h1>Add Recipe</h1>
        <form method="POST" action="AddRecipe">
            <div class="form-group">
                <label for="recipeName">Recipe Name:</label>
                <input type="text" id="recipeName" name="recipeName" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="imgURL">Image URL:</label>
                <textarea id="imgURL" name="imgURL" class="form-control" maxlength="500" oninput="imgURLucc()" required></textarea>
                <small><span id="imgURLCC">0</span> / 500 characters</small>
            </div>             
            <div class="form-group">
                <label for="ingredients">Ingredients:</label>
                <textarea id="ingredients" name="ingredients" class="form-control" maxlength="200" oninput="ingredientsucc()" required></textarea>
                <small><span id="ingredientsCC">0</span> / 200 characters</small>
            </div>            
            <div class="form-group">
                <label for="procedure">Procedure:</label>
                <textarea id="procedure" name="procedure" class="form-control" maxlength="750" oninput="procedureucc()" required></textarea>
                <small><span id="procedureCC">0</span> / 750 characters</small>
            </div>
            <div class="form-group">
                <label for="ytURL">Youtube Links:</label>
                <textarea id="ytURL" name="ytURL" class="form-control" maxlength="200" oninput="ytURLucc()" required></textarea>
                <small><span id="ytURLCC">0</span> / 200 characters</small>
            </div>             
            <div class="form-group">
                <input type="submit" value="Add Recipe" class="btn btn-primary">
            </div>
        </form>
    </div>
    
    <div class="footer">
        Made with Love, by CSE B - 2024
    </div>     

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script>
	    function imgURLucc() {
	        var textArea= document.getElementById("imgURL");
	        var CC= document.getElementById("imgURLCC");
	        
	        CC.textContent= textArea.value.length;
	    }    	
	    
	    function ingredientsucc() {
	        var textArea= document.getElementById("ingredients");
	        var CC= document.getElementById("ingredientsCC");
	        
	        CC.textContent= textArea.value.length;
	    }
	    
	    function procedureucc() {
	        var textArea= document.getElementById("procedure");
	        var CC= document.getElementById("procedureCC");
	        
	        CC.textContent= textArea.value.length;
	    }	    
    
	    function ytURLucc() {
	        var textArea= document.getElementById("ytURL");
	        var CC= document.getElementById("ytURLCC");
	        
	        CC.textContent= textArea.value.length;
	    }     
    </script>
</body>
</html>