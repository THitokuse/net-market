# メルカリDB設計

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
|prefecture_id|reference|NOT NULL, foreign_key: true|
|zip|varchar(16)|null: false|
|city|varchar(255)|null: false|
|street|varchar(255)|-------|
|birth_day|integer(8)|null: false|
|birth_month|integer(8)|null: false|
|birth_year|integer(8)|null: false|
|introduce|text|-------|

### Association
- has_many salers
- has_many buyers
- has_many likes
- has_many evalutes
- has_many todos
- belongs_to prefecture


## Prefecturesテーブル
- 都道府県マスターテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many users
- has_many items


## Itemsテーブル
- 商品出品テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|
|content|text|-------|
|price|int(16)|null: false|
|status_id|reference|null: false, foreign_key: true|
|prefecture_id|reference|null: false, foreign_key: true|
|deliverymethod_id|reference|null: false, foreign_key: true|
|deliveryburden_id|reference|null: false, foreign_key: true|
|deliverydate_id|reference|null: false, foreign_key: true|
|brand_id|reference|null: false, foreign_key: true|

### Association
- has_many salers
- has_many buyers
- has_many likes
- has_many comments
- has_many status
- has_many item_categories
- has_many categories through item_categories
- has_many itemimages
- belongs_to prefecture
- belongs_to brand
- belongs_to deliverydate
- belongs_to deliverymethod
- belongs_to deliveryburden


## Itemimagesテーブル
- 商品画像テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|item_id|reference|null: false, foreign_key: true|
|name|varchar(255)|null: false|
|image|varchar(255)|null: false|

### Association
- belongs_to item


## Salersテーブル
- 購入者中間テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to item


## Buyersテーブル
- 出品者中間テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to item


## Statusテーブル
- 商品ステータスマスターテーブル
1. 出品中
2. 取引中
3. 売却済


|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- belongs_to item


## Commentsテーブル
- 出品中の商品に対するコメント用テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|comment|text|null: false|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to item


## Evalutesテーブル
- ユーザー評価テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|user_id|reference|null: false, foreign_key: true|
|evalute_type_id|reference|null: false, foreign_key: true|

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
|user_id|reference|null: false, foreign_key: true|
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
|category_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to item
- belongs_to category


## Likeテーブル
- いいねテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

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
- ニューステーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|news|text|null: false|
