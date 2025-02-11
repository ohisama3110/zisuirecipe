class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }

  has_many :recipes, dependent: :destroy
  has_one_attached :profile_image
  has_many :comments, dependent: :destroy

  def image_url
    profile_image
  end

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end