class RecipesController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :show]

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
     flash[:notice] = "You have updated recipe successfully."
     redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  def search
    @query = params[:query]
    @recipes = Recipe.search(@query)
    if @recipes.empty?
      flash.now[:notice] = "検索結果が見つかりませんでした。"
    end
    render 'search_results'
  end

  def search_results
    @query = params[:query]
    @recipes = Recipe.search(@query)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:dish_name, :image, :introduction, :ingredient, :quantity, :process, :servings)
  end

  def is_matching_login_user
    recipe = Recipe.find(params[:id])
    unless recipe.user == current_user
      redirect_to recipe_path(recipe)
    end
  end
end
