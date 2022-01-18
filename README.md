# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| kana_family_name   | string  | null: false               |
| kana_first_name    | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :buying_items

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| text          | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| postage       | integer    | null: false                    |
| shipping_area | string     | null: false                    |
| take_days     | integer    | null: false                    |
| price         | integer    | null: false                    |
| commision     | integer    | null: false                    |
| profits       | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one :buying_item

## buying_item テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |
| shipping_adress_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_adress

## shipping_adress テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_code    | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| house_number | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association

- belongs_to :buy_item

