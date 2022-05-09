class PurchasesHistory < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :purchase
end
