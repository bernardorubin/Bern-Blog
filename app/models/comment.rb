class Comment < ApplicationRecord
  belongs_to :post

  scope :last_first, -> {order("created_at DESC")}
end
