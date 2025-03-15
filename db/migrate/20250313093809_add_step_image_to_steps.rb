class AddStepImageToSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :step_image, :string
  end
end
