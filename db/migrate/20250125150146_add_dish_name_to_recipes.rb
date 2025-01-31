class AddDishNameToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :dish_name, :string
    add_column :recipes, :ingredient, :string
    add_column :recipes, :quantity, :string
    add_column :recipes, :process, :string
  end
end
