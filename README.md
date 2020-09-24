# FURIMA
![スクリーンショット 2020-09-24 23 37 07](https://user-images.githubusercontent.com/67669319/94159797-f112bd80-febe-11ea-992e-d32d9316f0de.png)

## アプリ紹介
メルカリやラクマなどを参考としたフリマアプリです。
プログラミングスクールの最終課題として作成しました。
６人のチームで作成しました。

##### 主な機能
- 商品の一覧表示
- 商品の詳細表示
- 商品の投稿
- 商品の編集
- 商品の削除
- 商品の購入機能
- 商品のキーワード検索
- ユーザー登録
  - マイページ

##### 接続先情報
- URL http://54.250.34.193/
- ID/Pass
  - ID: o80b
  - Pass: o80b
- テスト用アカウント等
  - 購入者用
    - メールアドレス: sample2@gmail.com
    - パスワード: sample2
  - 購入用カード情報
    - 番号： 4242424242424242
    - 期限： 05/25 (日本標準時)
    - セキュリティコード：123
  - 出品者用
    - メールアドレス名: sample3@gmail.com
    - パスワード: sample3

## sd1104の担当
- DB設計
- ユーザー新規登録機能
- マイページ作成
- 購入済み商品のSOLD表示
- 商品の曖昧検索

## 開発状況
- 開発環境
  - Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
- 開発期間と平均作業時間
  - 開発期間：8/3〜8/25(23日間)
- 開発体制
  - 人数：6人
  - アジャイル型開発（スクラム）
  - Trelloによるタスク管理

## ローカルでの使用方法
#### 1. Git-Hubからクローンする。
`$ git clone https://github.com/sd1104/fleamarket_sample_80b.git`
#### 2. bundleをインストールする。
`$ bundle install`
#### 3. データベースを作る。
`$ rails db:create`
#### 4. マイグレーションをする。
`$ rails db:migrate`
#### 5. 初期データを入れる。
`$ rails db:seed`
#### 6. ローカルサーバーを起動する。
`$ rails s`
#### 7. ブラウザに表示。
[http://localhost:3000/]をたたく。

## データベース設計
![ER図](https://i.gyazo.com/e4e2689d841168878b8128edaeee83da.png)

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

#### Association
- has_many :items, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :product_address, dependent: :destroy
- has_one :credit, dependent: :destroy
- has_many :likes
- has_many :comments


### profilesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|user|references|null: false, foreign_key: true|

#### Association
- belongs_to :user, dependent: :destroy

### product_addressesテーブル

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

#### Association
- belongs_to :user, dependent: :destroy

### creditsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|credit_id|string|null: false|

#### Association
- belongs_to :user, dependent: :destroy

### itemsテーブル

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

#### Association
- belongs_to :user, dependent: :destroy, optional: true
- has_many :item_images, dependent: :destroy
- belongs_to :category, dependent: :destroy
- has_many :likes
- has_many :comments


### item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key:true|
|image|string|null: false|

#### Association
- belongs_to :item, optional: true


### categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

#### Association
- has_many :items


### likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key:true|
|item|references|null: false, foreign_key:true|

#### Association
- belongs_to :item
- belongs_to :user


### commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key:true|
|item|references|null: false, foreign_key:true|
|text|text|

#### Association
- belongs_to :item
- belongs_to :user
