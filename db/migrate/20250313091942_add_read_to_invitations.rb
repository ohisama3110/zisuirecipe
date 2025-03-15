class AddReadToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :read, :boolean, default: false
  end
end
