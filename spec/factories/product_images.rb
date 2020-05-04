FactoryBot.define do
  factory :product_image do 
    image {File.open("#{Rails.root}/public/uploads/product_image/image/1/IMG_1462.jpeg")}
    product_id {1}
  end
end