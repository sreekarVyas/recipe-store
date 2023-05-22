<%
	if (session.getAttribute("uname") == null) {
		response.sendRedirect("Registration.jsp");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.recipe_site.Recipes.Recipe" %>
<%@ page import="com.recipe_site.Recipes.GetRecipes" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>The Recipe Store</title>
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
    <!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
	    <a class="navbar-brand" href="Home.jsp">Recipe Store</a>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	        <ul class="navbar-nav mr-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="AddRecipe.jsp">Add Recipe</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="Profile.jsp"> <%= session.getAttribute("uname") %> </a>
	            </li>	            
	        </ul>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="Logout">Logout</a>
	            </li>	            
	        </ul>
	    </div>
	</nav>
	
	<div class="container-fluid">
		<div class="row row-cols-1 row-cols-md-4">	
			<div class="col mb-5">
		      			<img src='images/sunil.jpg' height=350px class="card-img-top" alt="">
			</div>	
			
			<div class="col mb-5">
		      			<img src='images/rithin.jpg' height=350px class="card-img-top" alt="">	
			</div>
			
			<div class="col mb-5">
		      			<img src='images/vamshidhar.jpg' height=350px class="card-img-top" alt="">	
			</div>
			
			<div class="col mb-5">
		      			<img src='images/saket.jpg' height=350px class="card-img-top" alt="">
			</div>			
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
