# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| kana_family_name   | string   | null: false               |
| kana_first_name    | string   | null: false               |
| birthday           | date     | null: false               |

### Association

- has_many :items
- has_many :buying_items

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| text             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| take_days_id     | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one :buying_item
- belong_to :category_id
- belong_to :condition_id
- belong_to :postage_id 
- belong_to :prefecture_id
- belong_to :take_days_id 


## buying_items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| buying_item   | references | null: false, foreign_key: true |

### Association

- belong_to :prefecture_id
- belong_to :buying_item

