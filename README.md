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

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|image|string|null: false|
|user|references|null: false, foreign_key: true|
|category1|references|null: false, foreign_key: true|
|category2|references|null: false, foreign_key: true|
|category3|references|null: false, foreign_key: true|
|category4|references|foreign_key: true|
|brand|text|
|condition|string|null: false|
|delivery|string|null: false|
|area|string|null: false|
|days|string|null: false|
|price|integer|null: false|
|good|references|null: false, foreign-key: true|
|comment|references|null: false, foreign-key: true|

## category1テーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item|references|null: false, foreign-key: true|

## category2テーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item|references|null: false, foreign-key: true|
|category1|references|null: false, foreign-key: true|

## category3テーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item|references|null: false, foreign-key: true|
|category2|references|null: false, foreign-key: true|

## category4テーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|item|references|null: false, foreign-key: true|
|category3|references|null: false, foreign-key: true|

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|

## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## user-ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rate|references|null: false|
|user|references|null: false|