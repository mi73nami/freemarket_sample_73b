class Product < ApplicationRecord
  has_many :product_images
  belongs_to :user
  belongs_to :category
  
  validates :name, :detail, :condition, :category_id, :delivery_fee, :shipping_area, :shipping_days, :price, presence: true

  accepts_nested_attributes_for :product_images, allow_destroy: true

end
