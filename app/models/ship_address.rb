class ShipAddress < ApplicationRecord
  belongs_to :user, optional: true
end
