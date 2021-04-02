# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false             |
| c_last_name        | string | null: false             |
| c_first_name       | string | null: false             |
| j_last_name        | string | null: false             |
| j_first_name       | string | null: false             |
| birthday           | date   | null: false             |

### Association

- has_many :items
- has_many :buyer

## items テーブル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| user          | references | null:false,foreign_kry: true |
| name          | string     | null: false                  |
| description   | text       | null: false                  |
| category_id   | integer    | null: false                  |
| status_id     | integer    | null: false                  |
| fee_id        | integer    | null: false                  |
| prefecture_id | integer    | null: false                  |
| term_id       | integer    | null: false                  |
| price         | integer    | null: false                  |

### Association

- has_one :buyer
- belongs_to :user

## buyers テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_kry: true |
| item   | references | null: false,foreign_kry: true |

### Association

has_one :address
belongs_to :user
belongs_to :item

## addresses テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| buyer         | references | null: false,foreign_kry: true |
| address_code  | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| address_line  | string     | null: false                   |
| building_name | string     |                               |
| phone_num     | string     | null: false                   |

### Association

belongs_to :buyer
