class Post < ApplicationRecord
  has_many :comments
  has_many :categories
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  belongs_to :user

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end
  
end
