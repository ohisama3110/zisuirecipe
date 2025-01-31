class ChangeServingsInRecipesToBeString < ActiveRecord::Migration[6.1]
  def change
    change_column :recipes, :servings, :string
  end
end
