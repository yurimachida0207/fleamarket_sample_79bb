## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null :false|

### Association

- has_many :items, dependent: :destroy
- has_one :destination, dependent: :destroy
- has_one :user_profile, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_many :buy_items, foreign_key: 'buyer_id', class_name: 'Item'
- has_many :sell_items, foreign_key: 'seller_id', class_name: 'Item', -> { where("buyer_id is NULL") }
- has_many :sold_items, foreign_key: 'seller_id, class_name: 'Item', -> { where("buyer_id is not NULL") }
 
## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|

### Association

- belongs_to :user

## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|ship_last_name|string|null: false|
|ship_last_name_kana|string|null: false|
|ship_first_name|string|null: false|
|ship_first_name_kana|string|null: false|
|phone_number|bigint|null: false, unique: true|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|address|string|null: false|
|second_address|string||

### Association

- belongs_to :user

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
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
|description|text|null: false|
|brand|string||
|condition|string|null: false|
|postage_id|string|null: false|
|prefecture_id|string|null: false|
|preparation_id|string|null: false|
|price|string|null: false|
|user|integer|null: false|
|buyer|integer||

### Association

- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- belongs_to :category
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id, optional: true'

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association

- has_many :items
- has_ancestry

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|string|null: false, foreign_key: true|
|image|string|null: false|

### Association

- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comment|text|null: false, foreign_key: true|

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