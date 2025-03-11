class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string   :ingredient,          null: false
      t.string   :quantity,          null: false
      t.timestamps
    end
  end
end
