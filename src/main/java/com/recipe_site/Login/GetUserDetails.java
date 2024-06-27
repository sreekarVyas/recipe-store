package com.recipe_site.Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.recipe_site.Login.User;

public class GetUserDetails {
	
	public static User getUser (String username) {
	
		Connection con= null;
		String uname= username;
		User user= null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/recipe-site-db", "root", "Sreekar@0125");
			PreparedStatement pst= con.prepareStatement("SELECT * FROM recipe_site_users WHERE username = ?");
			pst.setString(1, uname);
			
			ResultSet rs= pst.executeQuery();
			
			if (rs.next()) {
				String email= rs.getString("email");
				
				user= new User(uname, email);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return user;		
	}
}
