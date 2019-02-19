class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?
  before_action :set_categories


  protected

  def configure_permitted_parameter

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :tel, :prefecture_code, :zip, :city_name, :street, :birth_day, :birth_month, :birth_year, :self_introduce)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password)
    end
  end

  def set_categories
    @upper_categories = UpperCategory.eager_load(middle_categories: [:lower_categories])
  end

  def set_locale
    I18n.locale = :ja
  end
end
