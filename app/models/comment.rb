class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :last_first, -> {order("created_at DESC")}
end
