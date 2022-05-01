# テーブル設計

## Users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchase

## Items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| price       | integer | null: false |
| description | string  | null: false |
| user        | references | null: false, foreign_key: true |
| genre_id    | integer | null: false |
| status_id   | integer | null: false |
| bear_id     | integer | null: false |
| area_id     | integer | null: false |
| shipment_id | integer | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one_attached :image
- has_one :purchase
- has_one :shipAddress

## Comments テーブル

| Column | Type        | Options                        |
| ------ | ----------- | ------------------------------ |
| text   | text        | null: false                    |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## Purchases

| Column | Type        | Options                        |
| ------ | ----------- | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## ShipAddresses

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | string  | null: false |
| area_id      | integer | null: false |
| city         | string  | null: false |
| block_number | string  | null: false |
| building     | string  |  |
| phone_number | string  | null: false |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
