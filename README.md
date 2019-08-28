# Tarazon.com

https://user-images.githubusercontent.com/51869763/63823735-d4404980-c98f-11e9-8ed9-73e60c66d81e.png

１）プロジェクト名

Tarazon


２）テーマ

何も買えないECサイト風大喜利サービス

３）コンセプト

・「bokete」のような大喜利サイト

・「amazon」のようなecサイトがボケるプラットフォーム

・実際には何も買えない（金銭のやり取りは０）

４）プロジェクト名由来

こんなん売って「たら」　おもろい、
こんなレビューがあっ「たら」　おもろい

開発環境

１）クライアントサイド

HTML,CSS、JavaScript

２）サーバーサイド

ruby2.5.1

３）DB

MySQL




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
