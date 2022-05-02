require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "emailは@を含まないと登録できない" do
      @user.email = 'abc123-gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以下では登録できない" do
      @user.password = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "password_confirmationと一致していないと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが半角数字のみの場合は登録できない" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが半角英字のみの場合は登録できない" do
      @user.password = 'katsu'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが全角の場合は登録できない" do
      @user.password = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "family_nameが空では登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "family_nameは漢字・平仮名・カタカナ以外では登録できない" do
      @user.family_name = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameは漢字・平仮名・カタカナ以外では登録できない" do
      @user.first_name = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "family_name_katakanaが空では登録できない" do
      @user.family_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name katakana can't be blank")    
    end
    it "family_name_katakanaがカナ以外では登録できない" do
      @user.family_name_katakana = 'アイウエオ'
      @user.valid?
      expect(@user.errors.full_messages).to include()    
    end
    it "family_name_katakanaがひらがなでは登録できない" do
      @user.family_name_katakana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name katakana is invalid")    
    end 
    it "first_name_katakanaが空では登録できない" do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end
    it "first_name_katakanaがカナ以外では登録できない" do
      @user.first_name_katakana = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid")
    end
    it "first_name_katakanaがひらがなでは登録できない" do
      @user.first_name_katakana = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid")
    end
    it "birtdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end

     context '新規登録できるとき' do
        it 'nicknameとemail、family_name、first_name、family_name_katakana、first_name_katakana、passwordとpassword_confirmationが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
end

# binding.pry