class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :invitations

  validates :name, presence: true

  def available_invited_users
    User.joins(:followings).where(followings: {follower_id: users})
  end

  def has_invitation?(user)
    self.invitations.exists?(user_id: user.id)
  end
end
