class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
     create_table :recipes do |t|
       t.string :title
       t.text :introduction

       t.timestamps
     end
  end
end
