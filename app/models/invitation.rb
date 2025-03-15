class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :group

  after_create :create_notification

  def accept
    update(status: 'accepted')
    group.add_member(user)
  end

  def create_notification
    Notification.create(user: recipient, content: "You have received a group invitation.")
  end
end
