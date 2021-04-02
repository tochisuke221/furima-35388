# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| c_name      | string  | null: false |
| j_name      | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_day   | integer | null: false |

### Association

- has_many :items
- has_one :address

## items テーブル

| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| user        | references | null:false,foreign_kry: true |
| name        | string     | null: false                  |
| description | string     | null: false                  |
| category    | string     | null: false                  |
| status      | string     | null: false                  |
| fee         | string     | null: false                  |
| ship_from   | string     | null: false                  |
| term        | string     | null: false                  |
| price       | integer    | null: false                  |

### Association

- belongs_to :user
- has_one :address

## buyers テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| user          | references | null: false,foreign_kry: true |
| item          | references | null: false,foreign_kry: true |
| credit_num    | string     | null: false                   |
| credit_date   | string     | null: false                   |
| csv           | string     | null: false                   |
| address_code  | string     | null: false                   |
| prefecture    | string     | null: false                   |
| city          | string     | null: false                   |
| address_line  | string     | null: false                   |
| building_name | string     |                               |
| phone_num     | integer    | null: false                   |

### Association

belongs_to :item
belongs_to :user
