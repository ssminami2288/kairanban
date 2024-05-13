## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

belongs_to :posts
belongs_to :stamps

## admins テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

has_many :posts

## posts テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| title                  | string     | null: false |
| description            | text       | null: false |
| admin_id               | references | null: false, foreign_key: true |

has_many :admins
has_one :stamps
belongs_to :users



## stamps テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| post_id   | references | null: false, foreign_key: true |
| last_name | references | nu;;, false, foreign_key: true |

belongs_to :user
belongs_to :post
