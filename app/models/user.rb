class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, password_length: 7..128

  validates :nickname, :password, :email, :last_name, :first_name, :ruby_last_name, :ruby_first_name, :birthdate, presence: true
  has_many :products
  has_one :ship_address
end