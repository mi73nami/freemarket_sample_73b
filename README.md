# README

## ■ Summary
- This is a clone website of Japanese EC site.
- There are 4 people in our team.
- We did agile software development with a team of 4

## ■ Function
* user registration, login(wizard format)
* product selling
* product purchasing
* credit-card registration(PayJP)


## ■ Language
### server-side
* Ruby 2.5.1
### front-end
* jquery 1.12.4

## ■ Flamework
* Ruby on Rails 5.2.3

## ■ Database
* MySQL 5.6.47

## ■ Infrastructure
* AWS EC2
* AWS S3

## ■ Deploy
* automated deployment by capistrano

## ■ ER Diagram
![](https://i.gyazo.com/4af357ba9936aa0d2f9a3f6d5fc79c69.png)


## ■ Database Design

### products table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|condition|string|null:false|
|delivery_fee|integer|null:false|
|shipping_area|string|null:false|
|shipping_days|integer|null:false| 
|price|integer|null:false|
|user_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
#### Association
- has_many :product_images
- belongs_to :brand
- belongs_to :category
- belongs_to :user

### product_images table
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|product_id|references|null: false, foreign_key: true|
#### Association
- belongs_to :product

### categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|
#### Association
- has_many :products

### brands table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
#### Association
- has_many :products

### users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null: false, uniqueness: true|
|password|string|null: false, uniqueness: true|
|last_name|string|null: false|
|first_name|string|null: false|
|ruby_last_name|string|null:false|
|ruby_first_name|string|null:false|
|birthdate|date|null:false|
#### Association
- has_many :products
- has_one :credit_card
- has_one :ship_address

### ship_addresses table
|Column|Type|Options|
|------|----|-------|
|last_name|string|null:false|
|first_name|string|null:false|
|ruby_last_name|string|null:false|
|ruby_first_name|string|null:false|
|postal_code|integer|null: false| 
|prefectures|string|null: false|
|city|string|null: false|
|address_detail|string|null: false|
|apartment_name|string|
|room_number|string|
|phone_number|string|
|user_id|references|null: false, foreign_key: true|
#### Association
- belongs_to :user

### credit-cards table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|references|null: false, foreign_key: true|
|card_id|references|null: false, foreign_key: true|
#### Association
- belongs_to :user

