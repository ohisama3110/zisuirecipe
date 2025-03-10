class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.references :recipe, null: false, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
