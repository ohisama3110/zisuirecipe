class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    # create_table :recipes do |t|
    #   t.string :title
    #   t.text :introduction

    #   t.timestamps
    # end
    add_column :recipes, :dish_name, :string
    add_column :recipes, :ingredient, :string
    add_column :recipes, :quantity, :string
    add_column :recipes, :process, :string
  end
  end
end
