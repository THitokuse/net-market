# Net Market

## 開発環境(Environment)

### 前提条件
- githubアカウントの取得
- Docker for Mac(https://docs.docker.com/docker-for-mac/install/) or Docker for Windows(https://www.docker.com/docker-windows)　
のインストール

### Clone repository

```console
$ cd
$ mkdir projects
$ cd projects
$ git clone https://github.com/THitokuse/net-market.git
```

### databaseを作成
```console
// build docker image
$ docker-compose build

// create and migrate db
$ docker-compose run web bundle exec rake db:create
$ docker-compose run web bundle exec rake db:migrate
$ docker-compose run web bundle exec rake db:seed
```

### reCAPTCHAを導入

開発環境でユーザー新規登録、ログイン機能で使用するため、reCAPTCHAをそれぞれの環境で導入が必要
https://www.google.com/recaptcha/intro/v3.html

- 上記でreCAPTCHAを作成
- shelに作成時、生成されたSITE_KEYとPRIVATE_KEYの追加(ex: ~ /.bash_profile)
```
export RECAPTCHA_SITE_KEY="xxxxxxxxx"
export RECAPTCHA_PRIVATE_KEY="xxxxxxxx"
```

### local serverを立ち上げる
```console
$ docker-compose up
```
アクセス　http://localhost:3000

### 開発サーバーを止める
```console
$ docker-compose down
```

### bundle install
```console
$ docker-compose run web bundle install
```

### docker bashにログインする
```console
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
4e5622b8f25f        mercari_web         "bundle exec rails s…"   43 hours ago        Up 23 seconds       0.0.0.0:3000->3000/tcp   mercari_web_1
d47e7254918d        mysql:5.6           "docker-entrypoint.s…"   43 hours ago        Up 24 seconds       0.0.0.0:3306->3306/tcp   mercari_db_1
$ docker exec -it mercari_web_1 /bin/bash
```
ここでデバックなどのmercariの操作を行うことができる。

### net-market dbにログインする
```console
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
4e5622b8f25f        mercari_web         "bundle exec rails s…"   43 hours ago        Up 23 seconds       0.0.0.0:3000->3000/tcp   mercari_web_1
d47e7254918d        mysql:5.6           "docker-entrypoint.s…"   43 hours ago        Up 24 seconds       0.0.0.0:3306->3306/tcp   mercari_db_1
$ docker exec -it mercari_db_1 /bin/bash
$ mysql -u root -p
Enter password: mercari_umeda
mysql> show databases;
+---------------------+
| Database            |
+---------------------+
| information_schema  |
| mercari_development |
| mercari_test        |
| mysql               |
| performance_schema  |
+---------------------+
```
ここでnet-marketのDBの操作を行うことが可能。

また、Sequel proでの閲覧も可能(docker-compose upした状態)
sequel proで以下を設定する。
```
標準を選択

名前: mercari_localhost
ホスト: 127.0.0.1
ユーザー名: root
パスワード: mercari_umeda
ポート: 4306
```
で接続する。

### docker環境でRSpecを実行する
```
1.  docker-compose run web bundle exec rake db:migrate RAILS_ENV=test
→テスト環境でmigrateしてあげる
2. docker-compose run web bundle exec rspec spec/controllers/●●●●_controller_spec.rb
→指定したテストファイルを実行する
```

### docker上のMYSQLに日本語対応を追加する

通常だと、latin対応になっているので、テーブル上に日本語を入力しても表示されない。
そこで、/etc/mysql/my.cnfに記述し上書きすることで日本語設定にすることが出来る。

ターミナル上でmy.cnfを編集したいのだが、vimが入っていないので、vimを入れてあげる。
```
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
```
Build後、以下のコードを実行
```
$ docker exec -it mercari_db_1 /bin/bash
# apt-get update
# apt-get install vim
# vim etc/mysql/my.cnf
```
my.cnfの中で以下のコードを記述して保存
```
[mysqld]
character-set-server=utf8
collation-server=utf8_general_ci

[client]
default-character-set=utf8
```
もう一度Buildし直して、MYSQLを確認する

### Docker コマンドメモ

```
# Rubyのバージョンを確認する
$ docker-compose run --rm web ruby -v

# Railsのバージョンを確認する
$ docker-compose run --rm workspace php artisan -v

# rails routesをしたい
$ docker-compose run --rm web rails routes
```

## ネットマーケットDB設計

### ER図
https://www.draw.io/#G1OzJugJEFpL-U19UEEycdfbTGCAxYNAYY

![ネットマーケットER図](https://user-images.githubusercontent.com/45042275/55183070-5f939400-51d2-11e9-9950-6fe0605e4792.png)

## Usersテーブル
- ネットマーケットユーザ用テーブル

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
- has_many items
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
|upper_category|reference|null: false, foreign_key: true|
|middle_category|reference|null: false, foreign_key: true|
|lower_category|reference|null: false, foreign_key: true|
|size|reference|null: false, foreign_key: true|
|seller|reference|null: false, foreign_key: true|

- prefecture_code
jp_prefecture導入

### enum
- 商品ステータスenum
- Status: { 出品中:1, 取引中:2, 売却済:3 }


### Association
- has_many salers
- has_many likes
- has_many comments
- has_many status
- has_many item_images
- belongs_to brand
- belongs_to delivery_date
- belongs_to delivery_method
- belongs_to delivery_burden
- belongs_to upper_category
- belongs_to middle_category
- belongs_to lower_category
- belongs_to size
- belongs_to user

## Item_imagesテーブル
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


## Upper_categoriesテーブル
- カテゴリーテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many items
- has_many middle_categories

## Middle_categoriesテーブル
- カテゴリーテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|
|upper_category|reference|null: false, foreign_key: true|
|size_type|reference|null: false, foreign_key: true|

### Association
- has_many items
- has_many lower_categories
- belongs_to upper_category
- belongs_to size_type

## Lower_categoriesテーブル
- カテゴリーテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|
|middle_category|reference|null: false, foreign_key: true|

### Association
- has_many items
- belongs_to middle_category

## Size_typeテーブル
- サイズの種類テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|size_type|varchar(255)|null: false|

### Association
- has_many sizes
- has_many middle_categories

## Sizeテーブル
- サイズ(単位)テーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|
|size_type|reference|null: false, foreign_key: true|

### Association
- has_many items
- belongs_to size_type


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


## Delivery_methodテーブル
- 配送方法マスターテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many items


## Delivery_burdenテーブル
- 配送料の負担マスターテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer(11)|AI, PRIMARY_KEY|
|name|varchar(255)|null: false|

### Association
- has_many items


## Delivery_dateテーブル
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
