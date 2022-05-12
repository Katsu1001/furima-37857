require 'rails_helper'

  RSpec.describe PurchasePurchasesHistory, type: :model do

before do
user = FactoryBot.create(:user)
item = FactoryBot.create(:item)
@purchase_purchases_history = FactoryBot.build(:purchase_purchases_history,user_id: user.id , item_id: item.id)

sleep(1)

end

    describe "購入画面" do
      context '購入できないとき' do
        it "tokenが空だと登録できない" do
          @purchase_purchases_history.token = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("トークンを入力してください")
        end

        it "postal_codeが空だと登録できない" do
          @purchase_purchases_history.postal_code = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("カード情報を入力してください")
        end
        it "postal_codeは半角文字列でないと登録できない" do
          @purchase_purchases_history.postal_code = 'あああ'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("カード情報は不正な値です")
        end
        it "postal_codeは3桁ハイフン4桁の半角文字列でないと登録できない" do
          @purchase_purchases_history.postal_code = '１２３４ー５６７'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("カード情報は不正な値です")
        end
        it "shipping_area_idが--だと登録できない" do
          @purchase_purchases_history.shipping_area_id = 0
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("配送元の地域を入力してください")
        end
        it "municipalitiesが空だと登録できない" do
          @purchase_purchases_history.municipalities = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("市区町村を入力してください")
        end
        it "addressが空だと登録できない" do
          @purchase_purchases_history.address = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("郵便番号を入力してください")
        end
        it "telephone_numberが空だと登録できない" do
          @purchase_purchases_history.telephone_number = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("電話番号を入力してください")
        end
        it "telephone_numberは半角数値でないと登録できない" do
          @purchase_purchases_history.telephone_number = 'あああ'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("電話番号は不正な値です")
        end
        it "telephone_numberは9桁以下だと登録できない" do
          @purchase_purchases_history.telephone_number = '111111'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("電話番号は不正な値です")
        end
        it "telephone_numberは12桁以上だと登録できない" do
          @purchase_purchases_history.telephone_number = '111111111111111'
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("電話番号は不正な値です")
        end
        it "user_id（購入者）が空だと購入できない" do
          @purchase_purchases_history.user_id = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("購入者を入力してください")
        end
        it "item_id（購入商品）が空だと購入できない" do
          @purchase_purchases_history.item_id = ''
          @purchase_purchases_history.valid?
          expect(@purchase_purchases_history.errors.full_messages).to include("購入商品を入力してください")
        end
    
        context '購入ができるとき' do
          it "postal_codeとshipping_area_id、municipalities、address、telephone_number、tokenが存在すれば登録できる" do
            expect(@purchase_purchases_history).to be_valid
          end
            it "building_nameが空でも登録できる" do
              @purchase_purchases_history.building_name = ''
              expect(@purchase_purchases_history).to be_valid
            end
        end    

      end
    end

  end