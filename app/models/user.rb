class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      validates :nickname
      validates :family_name
      validates :first_name
      validates :family_name_katakana
      validates :first_name_katakana
      validates :birthday
       
end
