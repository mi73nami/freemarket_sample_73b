class Product < ApplicationRecord
  has_many :product_images
  belongs_to :user

  accepts_nested_attributes_for :product_images, allow_destroy: true
end
