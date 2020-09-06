# テーブル設計(README.mdは仕様書、掲示板みたいなもの。)
## 「こちら後々のエラーの原因となってしまう可能性のあるため指摘させていただきます。active hashの導入時のカラム名は「_id」を語尾につけるかと思いますのでprefecture_idなどとカラム名を変更しましょう！！」

## users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth_date_id   | date       | null: false                    |
## 14-16行目の誕生日に関するカラムですが、年、月、日を1つで指定して取得する（カラムが一つで済む）実装方法（date型）があります。また、今回のアプリで用意されているビューでは、ひとまとめで日付を実装するようになっているため、簡便化のためにもカラムが一つで済む実装方法を使用していただければと思います。「rails date型」と調べてみると、参考サイトが見つけられると思いますので、一度調べてみるといいと思います。

### Association

- has_many :items
- has_many :purchases

## has_manyですので、:itemと:purchaseは複数形にしましょう。

## profiles テーブル
## profilesテーブルの内容は「user」のエンティティの「属性」であると思われるので、usersテーブルのカラム名とするのが適切かと思われます！！



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_payer_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| handling_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## images テーブル
## こちらのテーブルですが、今回の実装では商品出品の画像投稿において「active_storage」を使用するため、設計の段階から削除しておきましょう。（理由はactive_storage導入時に自動でテーブルなどが生成されるからです）

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
## references型であるなら、カラム名はそれぞれ「user」「item」です！！
### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building_name | string     | default: ""                    |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |
## 電話番号のように0から始まる文字は数字としてしまうと0落ちと言われる先頭の0が消える現象が起きる可能性がありますので、stringにした方が無難です！！
### Association

- belongs_to :purchase