package com.recipe_site.Recipes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class AddRecipeServlet
 */
@WebServlet("/AddRecipe")
public class AddRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String recipeName= req.getParameter("recipeName");
        String imgURL= req.getParameter("imgURL");
        String ingredients= req.getParameter("ingredients");
        String procedure= req.getParameter("procedure");
        String ytURL= req.getParameter("ytURL");
		HttpSession session= req.getSession();
		String uname= (String) session.getAttribute("uname");
		
		Connection con= null;
		RequestDispatcher dispatcher= null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/recipe-site-db", "root", "Sreekar@0125");
			PreparedStatement pst= con.prepareStatement("INSERT INTO recipe_site_recipes(recipe_name, username, imgURL, ingredients, psteps, ytURL) VALUES (?, ?, ?, ?, ?, ?)");
			pst.setString(1, recipeName);
			pst.setString(2, uname);
			pst.setString(3, imgURL);
			pst.setString(4, ingredients);
			pst.setString(5, procedure);
			pst.setString(6, ytURL);
			
			int rc= pst.executeUpdate();
			
			if (rc > 0) {
				dispatcher= req.getRequestDispatcher("Home.jsp");
			} else {
				dispatcher= req.getRequestDispatcher("AddRecipe.jsp");
			}
			
			dispatcher.forward(req, res);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}

}
