class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_secure_password


  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end
end
