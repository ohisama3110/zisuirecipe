class AddDishNameToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :dish_name, :string
  end
end
