class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_fee
  belongs_to :shipping_area

  belongs_to :user
  has_one_attached :image
  has_one :purchases_history

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id,:condition_id,:delivery_fee_id,:shipping_area_id,:days_to_ship_id, numericality: { other_than: 0}
    #金額が300円以上9999999円以下のバリデーション
    validates :price,numericality: { only_integer:true, greater_than_or_equal_to:300, less_than_or_equal_to: 9999999 }

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price
    end

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
  end
end
