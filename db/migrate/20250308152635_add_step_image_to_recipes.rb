class AddStepImageToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :step_image, :blob
  end
end
