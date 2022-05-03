class Item < ApplicationRecord
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_fee
  belongs_to :shipping_area

  belongs_to :user
  has_one_attached :image
  has_one :purchases_history
end
