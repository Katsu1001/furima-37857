class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_katakana
    validates :first_name_katakana
    validates :birthday
    
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :family_name
      validates :first_name
    end

      with_options format: { with: /\A[ァ-ヶ一]+\z/ } do
        validates :family_name_katakana
        validates :first_name_katakana
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         
       
end
