# CosMe

<!-- This README would normally document whatever steps are necessary to get the
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

* ... -->

コスメに関する口コミサイトです。

ユーザーの新規登録から口コミの投稿ができます。


## サイトURL

https://cosme-28321.herokuapp.com/


- Basic認証

ユーザー名：admin
パスワード：2222

- テスト用アカウント

ユーザーネーム：いとさお
メールアドレス：ito@sao.a
パスワード：s11111


# 利用方法

- ユーザー登録機能として、ニックネーム、メールアドレス、パスワード、パスワード(確認)を登録します。

- 口コミ投稿機能として、画像、タイトル、テキストの情報をDBへ登録する事ができます。


# 課題解決

コスメに関心のある女性の欲しいコスメを買ってからの失敗を未然にできるだけ防ぐということを課題にしました。
気になるコスメアイテムの口コミ情報を閲覧したり、投稿する事で、同じ層のユーザーが情報を共有し、最先端のトレンドを知る事ができます。


# 実装予定の機能

- 投稿した口コミにユーザー名を表示させること
- 口コミ詳細、編集、削除機能の追加
- コメント機能の追加
- イイね機能の追加


# ER図

https://gyazo.com/422c5a38d83fd786003c007e8658df7b


# テーブル設計

## user テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :tweets
- has_many :comments


## tweet テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | text       | null: false                    |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## comment テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| tweet  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet
