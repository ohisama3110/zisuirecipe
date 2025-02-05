class ChangeServingsInRecipesToBeString < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :servings, :string
  end
end
