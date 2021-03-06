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
|name|string|null: false|
|email|string|null: false, unique: true|
|number|integer|null: false, unique: true|
|birthday|integer|null: false|
|postCode|integer|
|prefectures|string|
|city|string|
|streetNumber|string|
|building|string|
|cordNumber|integer|null: false, unique: true|
|profile|text|
|password| |null: false, unique: true|

### Association
- has_many :items
- has_many :goods
- has_many :comments
- has_many :rates, through: :user-rates

## itemsテーブルOK
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|image|string|null: false|
|user|references|null: false, foreign_key: true|
|category1|references|null: false, foreign_key: true|
|brand|text|
|condition|string|null: false|
|delivery|string|null: false|
|area|string|null: false|
|days|string|null: false|
|price|integer|null: false|
|good|references|null: false, foreign-key: true|
|comment|references|null: false, foreign-key: true|

### Association
- belongs_to :user
- has_many :goods
- has_many :comments
- has_many :children, class_name: :Category, foreign_key: :parent_id

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|parent_category|references|null: false, foreign-key: true|

### Association
- belongs_to :parent, class_name: :Item


## goodsテーブルOK
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|

### Association
- belongs_to :user
- belongs_to :item

## commentsテーブルOK
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|

### Association
- belongs_to :user
- belongs_to :item

## ratesテーブルOK
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users, through: :user-rates

## user-ratesテーブルOK
|Column|Type|Options|
|------|----|-------|
|rate|references|null: false|
|user|references|null: false|

### Association
- belongs_to :user
- belongs_to :rate


