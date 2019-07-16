# Tarazon.com

## users table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :products
- has_many :reviews

## reviews table
|Column|Type|Options|
|------|----|-------|
|name|string||
|rate|integer||
|body|text||
|product_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## products table
|Column|Type|Options|
|------|----|-------|
|title|string||
|image|text||
|description|text||
|price|integer||
|user_id|integer||
### Association
- belongs_to :user
- has_many :reviews
