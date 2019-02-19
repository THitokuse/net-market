# メルカリDB設計

## ER図
https://www.draw.io/#G1OzJugJEFpL-U19UEEycdfbTGCAxYNAYY

## Usersテーブル
- メルカリユーザ用テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|nickname|varchar(255)|null: false|
|first_name|varchar(255)|null: false|
|last_name|varchar(255)|null: false|
|first_name_kana|varchar(255)|null: false|
|last_name_kana|varchar(255)|null: false|
|email|varchar(255)|null: false|
|tel|varchar(32)|null: false|
|password|varchar(255)|null: false|
|prefecture_code|integer(11)|null: false|
|zip|varchar(16)|null: false|
|city_name|varchar(255)|null: false|
|street|varchar(255)|-------|
|birth_day|integer(8)|null: false|
|birth_month|integer(8)|null: false|
|birth_year|integer(8)|null: false|
|self_introduce|text|-------|

- prefecture_code
jp_prefecture導入

### Association
- has_many salers
- has_many buyers
- has_many likes
- has_many evalutes
- has_many todos
- has_many notice


## Itemsテーブル
- 商品出品テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|
|content|text|-------|
|price|int(16)|null: false|
|prefecture_code|integer(11)|null: false|
|status|integer(2)|null:false, default: 0|
|deliverymethod|reference|null: false, foreign_key: true|
|deliveryburden|reference|null: false, foreign_key: true|
|deliverydate|reference|null: false, foreign_key: true|
|brand|reference|null: false, foreign_key: true|

- prefecture_code
jp_prefecture導入

### enum
- 商品ステータスenum
- Status: { 出品中:1, 取引中:2, 売却済:3 }


### Association
- has_many salers
- has_many buyers
- has_many likes
- has_many comments
- has_many status
- has_many item_categories
- has_many categories through item_categories
- has_many itemimages
- belongs_to brand
- belongs_to deliverydate
- belongs_to deliverymethod
- belongs_to deliveryburden


## Itemimagesテーブル
- 商品画像テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|item|reference|null: false, foreign_key: true|
|name|varchar(255)|null: false|
|image|varchar(255)|null: false|

### Association
- belongs_to item


## Salersテーブル
- 購入者中間テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to item


## Buyersテーブル
- 出品者中間テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|user|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to item


## Commentsテーブル
- 出品中の商品に対するコメント用テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|comment|text|null: false|
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to item


## Evalutesテーブル
- ユーザー評価テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|user|reference|null: false, foreign_key: true|
|evalute_type|reference|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to evalute_types


## Evalute_typesテーブル
- 評価種類マスターテーブル
1. 良い
2. 普通
3. 悪い

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many evalutes


## Todosテーブル
- やることリストテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|user|reference|null: false, foreign_key: true|
|to_do|varchar(255)|null: false|

### Association
- belongs_to user


## Brandsテーブル
- ブランドテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many items


## Categoriesテーブル
- カテゴリーテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|
|parent_id|integer(16)|null: false|

### Association
- has_many item_categories
- has_many items through item_categories


## Item_categoriesテーブル
- 商品カテゴリー中間テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|category|reference|null: false, foreign_key: true|
|item|reference|null: false, foreign_key: true|

### Association
- belongs_to item
- belongs_to category


## Likeテーブル
- いいねテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to item
- belongs_to user


## Deliverymethodテーブル
- 配送方法マスターテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many items


## Deliveryburdenテーブル
- 配送料の負担マスターテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many items


## Deliverydateテーブル
-　発送日の目安マスターテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many items


## Newsテーブル
- メルカリ全員分のニューステーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|news|text|null: false|


## Noticeテーブル
- 個々のニュースを格納するためのニュース

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|notice|text|null: false|
|user|reference|null: false, foreign_key: true|

### Association
- belongs_to user
