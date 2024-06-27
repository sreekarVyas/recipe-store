package com.recipe_site.Registration;

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

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/Register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String uemail= req.getParameter("email");
		String uname= req.getParameter("username");
		String pass= req.getParameter("password");
		
		Connection con= null;
		RequestDispatcher dispatcher= null;
		
		if (((uemail == null) || (uemail == "")) || ((uname == null) || (uname == "")) || ((pass == null) || (pass == ""))) {
			req.setAttribute("status", "Empty Fields Found");
			dispatcher= req.getRequestDispatcher("Registration.jsp");
			
			dispatcher.forward(req, res);
		}		
				
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/recipe-site-db", "root", "Sreekar@0125");
			PreparedStatement pst= con.prepareStatement("INSERT INTO recipe_site_users(email, username, password) VALUES (?, ?, ?)");
			pst.setString(1, uemail);
			pst.setString(2, uname);
			pst.setString(3, pass);
			
			int rc= pst.executeUpdate();
			dispatcher= req.getRequestDispatcher("Registration.jsp");
						
			if (rc > 0) {
				req.setAttribute("status", "success");
			} else {
				req.setAttribute("status", "failed");
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
