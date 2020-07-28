# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreignkey: true|
|user_name|string|null: false|
|email|string|null: false, unique: true|
|password|integer|null: false|
|group_id|integer|null: false|

### Association

- has_many :items, dependent: destroy
- has_one :destinations, dependent: destroy
- has_one :user_profiels, dependent: destroy
- has_one :credit_cards, dependent: destroy
- has_many :buy_items, foreign_key: 'buyer_id', class_name: 'Item'
- has_many :sell_items, foreign_key: 'seller_id', class_name: 'Item', -> { where("buyer_id is NULL") }
- has_many :sold_items, foreign_key: 'seller_id, class_name: 'Item', -> { where("buyer_id is not NULL") }
 
## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreignkey: true|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association

- belongs_to :user

## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreignkey: true|
|ship_last_name|string|null: false|
|ship_last_name_kana|string|null: false|
|ship_first_name|string|null: false|
|ship_first_name_kana|string|null: false|
|phone_number|integer|null: false|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|second_adress|string||

### Association

- belongs_to :user

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreignkey: true|
|card_number|integer|null: false|
|card_month|integer|null: false|
|card_year|integer|null: false|
|card_code|integer|null: false|

### Association

- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|description|string|null: false|
|brand|string|null: false|
|condition|string|null: false|
|postage_payer|string|null: false|
|ship_from|string|null: false|
|price|string|null: false|
|seller|integer|null: false|
|buyer|integer||

### Association

- has_many :images, dependent: destroy
- has_many :comments, dependent: destroy
- has_many :favorites, dependent: destroy
- belongs_to :category
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id, optional: true'

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|ancestry|integer||


### Association

- has_many :items

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|string|null: false, foreignkey: true|
|image|string|null: false|

### Association

- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item