class Post < ApplicationRecord
  has_many :products
  has_many :categories
end
