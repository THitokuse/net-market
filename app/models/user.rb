class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  include JpPrefecture
  jp_prefecture :prefecture_code
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :tel
    validates :prefecture_code
    validates :zip
    validates :city_name
    validates :birth_year
    validates :birth_month
    validates :birth_day
  end
end
