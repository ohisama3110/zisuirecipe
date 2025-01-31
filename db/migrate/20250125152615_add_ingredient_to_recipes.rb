class AddIngredientToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :ingredient, :string
  end
end
