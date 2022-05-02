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
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
       
end
