package com.recipe_site.Recipes;

public class Recipe {
	
	public String recipeName;
	public String roname;
	public String imgURL;
	public String ingredients;
	public String psteps;
	public String ytURL;

	public Recipe(String recipeName, String roname, String imgURL, String ingredients, String psteps, String ytURL) {
		this.recipeName= recipeName;
		this.roname= roname;
		this.imgURL= imgURL;
		this.ingredients= ingredients;
		this.psteps= psteps;
		this.ytURL= ytURL;
	}	
}
