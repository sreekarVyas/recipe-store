package com.recipe_site.Recipes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GetMyRecipes {
	
	public static List<Recipe> getMyRecipes (String username) {
	
		Connection con= null;
		List<Recipe> recipes= new ArrayList<>();
		String uname= username;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/recipe-site-db", "root", "Sreekar@0125");
			PreparedStatement pst= con.prepareStatement("SELECT * FROM recipe_site_recipes WHERE username = ?");
			pst.setString(1, uname);
			
			ResultSet rs= pst.executeQuery();
			
			while (rs.next()) {
				String recipeName= rs.getString("recipe_name");
				String imgURL= rs.getString("imgURL");
				String ingredients= rs.getString("ingredients");
				String psteps= rs.getString("psteps");
				String ytURL= rs.getString("ytURL");
				
				Recipe recipe= new Recipe(recipeName, uname, imgURL, ingredients, psteps, ytURL);
				recipes.add(recipe);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return recipes;
	}		
}
