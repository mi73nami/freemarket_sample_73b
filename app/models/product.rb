class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :seller, class_name: "User", optional: true, foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", optional: true, foreign_key: "buyer_id"
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, :detail, :condition, :category_id, :delivery_fee, :shipping_area, :shipping_days, :price, presence: true

  accepts_nested_attributes_for :product_images, allow_destroy: true
  validates_presence_of :product_images
end
