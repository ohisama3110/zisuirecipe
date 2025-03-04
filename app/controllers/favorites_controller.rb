class FavoritesController < ApplicationController

  def index
    @favorite_recipes = current_user.favorites.map(&:recipe)
    if @favorite_recipes.empty?
      @no_favorite_message = "お気に入りのレシピがありません"
    end
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.new(recipe_id: recipe.id)
    favorite.save
    redirect_to recipe_path(recipe)
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: recipe.id)
    favorite.destroy
    redirect_to recipe_path(recipe)
  end

end
