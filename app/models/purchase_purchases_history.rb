class PurchasePurchasesHistory
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id,:token

  # 空欄はNGのバリデーション
  with_options presence: true do
    validates :postal_code
    validates :municipalities
    validates :address
    validates :telephone_number
    validates :token
    validates :user_id
    validates :item_id
 end

  # #ジャンルの選択が「--」の時は保存できないようにするバリデーション設定する
 validates :shipping_area_id, numericality: { other_than: 0 }

#郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）のバリデーション
 validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }

#電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）のバリデーション
validates :telephone_number, format: {with: /\A\d{10,11}\z/}

  def save
    purchases_history = PurchasesHistory.create!(item_id: item_id, user_id: user_id)
    Purchase.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchases_history_id: purchases_history.id)
  end
end