require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "出品新規登録" do
    context '出品ができないとき' do
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "introductionが空だと登録できない" do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "category_idが--だと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "condition_idが--だと登録できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "delivery_fee_idが--だと登録できない" do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it "shipping_area_idが--だと登録できない" do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it "days_to_ship_idが--だと登録できない" do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it "priceが半角英数混合だと登録できない" do
        @item.price = 'a1a1a1'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は不正な値です")
      end
      it "priceが半角英語だけだと登録できない" do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は不正な値です")
      end
      it "priceが全角文字では登録できない" do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は不正な値です")
      end
      it "priceが299円以下では登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300円以上で入力してください")
      end
      it "priceが10000000円以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以内で入力してください")
      end
      it "ユーザー情報がないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
    end
  
    context '出品ができるとき' do
      it "nameとintroduction、category_id、condition_id、delivery_fee_id、shipping_area_id、days_to_ship_id、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end    
  end
end