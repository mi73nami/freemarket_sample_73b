class ShipAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :last_name, :first_name ,:ruby_last_name, :ruby_first_name, :postal_code, :prefectures, :city, :address_detail, presence: true
end