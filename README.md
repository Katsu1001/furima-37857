# テーブル設計

## Users テーブル

  |  Column           |  Type      | Option    |
  |------------        |--------    |--------   |
  |nickname            |string      |null:false |
  |email               |string      |unique: true, null:false|
  |encrypted_password  |string      |null:false |
  |family_name         |string      |null:false |
  |first_name          |string      |null:false |
  |family_name_katakana         |string      |null:false |
  |first_name_katakana          |string      |null:false |
  |birthday            |date    |null:false|
  
  ## Association
  - has_many :items
  - has_many :purchases_histories


<!-- 
  ~usersテーブルが持っている情報~
1.ニックネーム
2.メールアドレス
3.パスワード（６文字以上）
  (理由:)passwordカラムは削除。deviseのgemがあらかじめ用意しているencrypted_passwordを使用しているため。
4.パスワード（確認）
5.お名前(全角)
6.お名前カナ(全角)
7.生年月日  -->

## Items テーブル


  |  Column         |  Type     | Option    |
  |------------     |--------   |--------   |
  |name             |string     |null:false |
  |introduction     |text       |null:false |
  |category_id      |integer    | null:false |
  |condition_id     |integer    | null:false |
  |delivery_fee_id  |integer    |null:false |
  |shipping_area_id |integer    |null:false |
  |days_to_ship_id  |integer    |null:false |
  |price            |integer       |null:false |
  |user             |references | null: false, foreign_key: true |

  ## Association
  - belongs_to :user
  - has_one :purchase_history
  

<!-- 
  ~itemsテーブルが持っている情報~
2.商品名（４０文字まで）
3.商品の説明（１０００文字まで）
 
  <<商品の詳細という大枠（これは情報ではない）>>
4.カテゴリー
5.商品の状態

  <<配送についてという大枠（これは情報ではない）>>
6.配送料の負担
7.発送元の地域
8.発送までの日数 

  <<販売価格という大枠（これは情報ではない）>>
9.価格
  （価格を埋めれば自動的に販売手数料、利益入る仕組みユーザー自身は入力しない）
-->

## Purchases テーブル

  |  Column        |Type    | Option    |
  |------------     |--------|--------   |
  |postal_code      |string  |null:false |
  |shipping_area_id      |integer  |null:false |
  |municipalities   |string  |null:false |
  |address          |string  |null:false |
  |building_name    |string  |           |
  |telephone_number |string  |null:false |
  |purchases_history|references | null: false, foreign_key: true |
  
  ## Association
  - has_many :purchase_histories


<!-- 
  ~購入テーブルが持っている情報~

  <<配送先入力という大枠（これは情報ではない）>>
1.郵便番号 
2.都道府県
3.市区町村
4.番地
5.建物名
  (※任意入力なのでオプションの箇所は空欄にした)
6.電話番号
7.購入履歴
 -->

 ## Purchases_histories テーブル

  |  Column        |Type    | Option    |
  |------------     |--------|--------   |
  |user             | references | null: false, foreign_key: true |
  |item             | references | null: false, foreign_key: true |

  ## Association
  - belongs_to :item
  - belongs_to :user
  - belongs_to :purchase
  
  <!--
  ~購入履歴テーブルが持っている情報~

  1.購入するユーザーの情報
    (ex. いいねなどの評価)
  2.過去に購入したもの
  -->
