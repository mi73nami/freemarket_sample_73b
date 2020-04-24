class Product < ApplicationRecord
  has_many :product_images
  belongs_to :user
  belongs_to :category
end
