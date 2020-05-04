FactoryBot.define do

  factory :product do
    name                   {"スニーカー"}
    detail                 {"新品のスニーカーです"}
    condition              {"新品、未使用"}
    delivery_fee           {"送料込み(出品者負担)"}
    shipping_area          {1}
    shipping_days          {"1~2日で発送"}
    price                  {"500"}
    created_at             {"2020-04-04"}
    category_id            {4}
    user_id                {1}
    product_images {[
      FactoryBot.build(:product_image, product: nil)
    ]}
  end

end