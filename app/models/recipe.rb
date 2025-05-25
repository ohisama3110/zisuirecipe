class Recipe < ApplicationRecord

  has_one_attached :image
  has_one_attached :step_image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :steps

  validates :dish_name, presence: true
  validates :image, presence: true

  validate :at_least_one_valid_ingredient
  validate :at_least_one_valid_step

  def get_image
    unless image.attached?
      file_path = Rails.root.join('zisuirecipe/app/assets/images/25480379.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def get_step_image
    unless step_image.attached?
      file_path = Rails.root.join('path/to/default_image.jpg')
      step_image.attach(io: File.open(file_path), filename: 'default-step-image.jpg', content_type: 'image/jpeg')
    end
    step_image
  end

  def self.search(query)
    where("dish_name LIKE ? OR ingredient LIKE ?", "%#{query}%", "%#{query}%")
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  private

  def at_least_one_valid_ingredient
    valid_ingredients = ingredients.select do |i|
      i.ingredient.present? && i.quantity.present?
    end

    if valid_ingredients.empty?
      errors.add(:ingredients, "を1つ以上入力してください（材料および分量）")
    end
  end

  def at_least_one_valid_step
    valid_steps = steps.select do |s|
      s.process.present?
    end

    if valid_steps.empty?
      errors.add(:steps, "を1つ以上入力してください")
    end
  end
end
