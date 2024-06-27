package com.recipe_site.Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.*;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String uname= req.getParameter("username");
		String pass= req.getParameter("password");
		HttpSession session= req.getSession();
		
		Connection con= null;
		RequestDispatcher dispatcher= null;
		

		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/recipe-site-db", "root", "Sreekar@0125");
			PreparedStatement pst= con.prepareStatement("SELECT * FROM recipe_site_users WHERE (username = ?) AND (password = ?)");
			pst.setString(1, uname);
			pst.setString(2, pass);
			
			ResultSet rs= pst.executeQuery();
			if (rs.next()) {
				session.setAttribute("uname", rs.getString("username"));
				dispatcher= req.getRequestDispatcher("Home.jsp");
			} else {
				req.setAttribute("status", "failed");
				dispatcher= req.getRequestDispatcher("Login.jsp");
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
