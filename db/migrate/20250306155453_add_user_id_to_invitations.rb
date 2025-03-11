class AddUserIdToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_reference :invitations, :user, null: false, foreign_key: true
  end
end
