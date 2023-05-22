<%
	if (session.getAttribute("uname") == null) {
		response.sendRedirect("Registration.jsp");
		return;
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.recipe_site.Recipes.Recipe" %>
<%@ page import="com.recipe_site.Recipes.GetMyRecipes" %>
<%@ page import="com.recipe_site.Login.User" %>
<%@ page import="com.recipe_site.Login.GetUserDetails" %>
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
        
        .recipe {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #e1e1e1;
            border-radius: 5px;
        }
        
        .recipe h3 {
            margin-top: 0;
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
    <!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
	    <a class="navbar-brand" href="Home.jsp">Recipe Store</a>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	        <ul class="navbar-nav mr-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="AddRecipe.jsp">Add Recipe</a>
	            </li>
	        </ul>
	        <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	                <a class="nav-link" href="Logout">Logout</a>
	            </li>
	        </ul>
	    </div>
	</nav>

	<div class="container">
	  	<div class="row justify-content-center">
	    	<div class="col-md-4">
	      		<div class="card text-center">
		        	<div class="card-body">
		          		<h5 class="card-title">Profile Info</h5>
		          		
		          		<%
		          			User user= GetUserDetails.getUser((String) session.getAttribute("uname"));
		          		%>
		          				          		
	    	      		<p class="card-text">Name: <%= user.username %></p>
	        	  		<p class="card-text">Email: <%= user.email %></p>
	        		</div>
	      		</div>
	    	</div>
	  	</div>
	</div>
	
    <div class="mt-3 container">
    
    	<%
    		List<Recipe> recipes= GetMyRecipes.getMyRecipes((String) session.getAttribute("uname"));
    	%>
    	    	
    	<h3 class="text-center text-light">
    		<%
    			if (recipes.size() == 0) {
    		%>
    		
    				You have not made any recipe contributions yet.
    		
    		<%
    			} else {
    		%>
    	
    				My Recipes 
    		
    		<%
    			}
    		%>
    	</h3>   
    	 
		<div class="row row-cols-1 row-cols-md-3 g-4">
		<%
			
			for (Recipe rp : recipes) {
		%>
		
			<div class="col mb-5">
				<div class="card">
		      		<div class="card-body">
		      			<img src='<%= rp.imgURL %>' height=308px class="card-img-top" alt="<%= rp.recipeName %>">
		        		<h5 class="card-title"><%= rp.recipeName %></h5>
		        		<h6 class="card-title">Ingredients</h6>
		        		<p class="card-text"><%= rp.ingredients %></p>
		        		<h6 class="card-title">Procedure</h6>
		        		<p class="card-text"><%= rp.psteps %></p>
		        		<a href='<%= rp.ytURL %>' target="_blank" class="btn btn-danger">Check Youtube</a>
		      		</div>					
				</div>
			</div>	
			
		<%
			}
		%>	
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
