class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }

  has_many :recipes, dependent: :destroy
  has_one_attached :profile_image

  def image_url
    profile_image
  end

  # def get_image
  #   unless image.attached?
  #     file_path = Rails.root.join('zisuirecipe/app/assets/images/25480379.jpg')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   image
  # end

  # def get_profile_image(width, height)
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/images/25480379.jpg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   profile_image.variant(resize: "#{width}x#{height}").processed
  # end
end