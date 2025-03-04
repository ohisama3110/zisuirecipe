class Recipe < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :dish_name, presence: true
  validates :image, presence: true
  validates :ingredient, presence: true
  validates :quantity, presence: true
  validates :process, presence: true
  validates :servings, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('zisuirecipe/app/assets/images/25480379.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.search(query)
    where("dish_name LIKE ? OR ingredient LIKE ?", "%#{query}%", "%#{query}%")
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
