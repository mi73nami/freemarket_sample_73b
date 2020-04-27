class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
  belongs_to :user
  belongs_to :category


  accepts_nested_attributes_for :product_images, allow_destroy: true

end
