class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?

  def configure_pemitted_parameter
    devise_parameter_sanitizer(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :tel, :prefecture_code, :zip, :city_name, :street, :birth_day, :birth_month, :birth_year, :self_introduce])
  end
end
