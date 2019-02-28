class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google, :facebook]

  has_many :items

  include JpPrefecture
  jp_prefecture :prefecture_code

  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  # end

  # def prefecture_name=(prefecture_name)
  #   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end

  protected
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
