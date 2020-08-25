# fleamarket_sample_80b


![ER図](https://gyazo.com/cd2479027cbbdaee8383aed3e81f01f2)

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- has_many :items, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :product_address, dependent: :destroy
- has_one :credit, dependent: :destroy
- has_many :likes
- has_many :comments


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy

## product_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture_code|integer|null: false|
|address_city|string|null: false|
|address_street|string|null: false|
|building_name|string|
|phone_number|string|unique:true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy

## creditsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|credit_id|string|null: false|

### Association
- belongs_to :user, dependent: :destroy

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|brand|string|
|condition_id|string|null: false|
|delivery_charge_id|string|null:false|
|derivery_origin_id|string|null:false|
|delivery_date_id|string|null:false|
|category_id|bigint|null: false, foreign_key: true|
|price|integer|null: false|
|seller_id|bigint|null:false, foreign_key:true|
|buyer_id|bigint|foreign_key:true|

### Association
- belongs_to :user, dependent: :destroy, optional: true
- has_many :item_images, dependent: :destroy
- belongs_to :category, dependent: :destroy
- has_many :likes
- has_many :comments


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key:true|
|image|string|null: false|

### Association
- belongs_to :item, optional: true


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key:true|
|item|references|null: false, foreign_key:true|

### Association
- belongs_to :item
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key:true|
|item|references|null: false, foreign_key:true|
|text|text|

### Association
- belongs_to :item
- belongs_to :user