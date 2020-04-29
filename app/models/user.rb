class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, password_length: 7..128
  
  
  has_many :buyed_product, foreign_key: "buyer_id", class_name: "product"
  has_many :saling_product, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "product"
  has_many :sold_product, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "product"

  validates :nickname, :password, :email, :last_name, :first_name, :ruby_last_name, :ruby_first_name, :birthdate, presence: true
  has_many :products
  has_one :ship_address
  has_one :credit_card, dependent: :destroy
end