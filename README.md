# fleamarket_sample_80b


![ER図](https://i.gyazo.com/536d1a63631d62771dc57dca6a6b6bdd.png)

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- has_many :items, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :product_address, dependent: :destroy
- has_one :credit, dependent: :destroy


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
|address_prefecture|integer|null: false|
|address_city|string|null: false|
|address_street|string|null: false|
|building_name|string|
|phone_number|integer|unique:true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy

## creditsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
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
|condition|integer|null: false|
|delivery_charge|integer|null:false|
|derivery_origin|integer|null:false|
|delivery_date|integer|null:false|
|category|references|null: false, foreign_key: true|
|price|integer|null: false|
|seller|references|null:false, foreign_key:true|
|buyer|references|foreign_key:true|

### Association
- belongs_to :user, dependent: :destroy
- has_many :item_images, dependent: :destroy
- belongs_to :category, dependent: :destroy


## item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key:true|
|image|string|null: false|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items
