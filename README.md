# README


### DB設計


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|　（商品名）
|detail|text|null:false|　（商品説明）
|condition|string|null:false|　（商品の状態）
|delivery_fee|integer|null:false|　（配送料）
|shipping_area|string|null:false|　（発送元）
|shipping_days|integer|null:false| 　（発送までの日数）
|price|integer|null:false|　（価格）
|existence|enum|null:false| (商品が購入済みかどうか）
|user_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
### Association
- has_many :product_images
- belongs_to :brand
- belongs_to :category
- belongs_to :user


## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|
### Association
- has_many :products


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false　(ニックネーム)
|email|string|null: false, uniqueness: true| (メール)
|password|string|null: false, uniqueness: true|　(パスワード)
|last_name|string|null: false|　(苗字)
|first_name|string|null: false|　(名前)
|ruby_last_name|string|null:false|　(苗字ひらがな)
|ruby_first_name|string|null:false|　(名前ひらがな)
|birthdate|date|null:false|　(生年月日)
### Association
- has_many :products
- has_one :credit_card
- has_one :ship_address


## ship_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null:false|　(苗字)
|first_name|string|null:false| (氏名)
|ruby_last_name|string|null:false|　(苗字ひらがな)
|ruby_first_name|string|null:false|　(名前ひらがな)
|postal_code|integer|null: false| 
|prefectures|string|null: false|
|city|string|null: false|
|address_detail|string|null: false|
|apartment_name|string|
|room_number|string|
|phone_number|string|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user



## credit-cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|token|integer|null: false|
### Association
- belongs_to :user

