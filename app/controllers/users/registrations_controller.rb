# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :configure_permitted_parameters, only: [:create]
  prepend_before_action :user_sms_confirmation, only: [:sms_confirmation_create]
  prepend_before_action :user_address, only: [:address_create]

  before_action :login_verify, only: [:sms_confirmation, :sms_confirmation_create, :address, :address_create, :registration_complete]

  def index

  end

  def new
    super
  end

  def create
    super
  end

  def sms_confirmation
  end

  def sms_confirmation_create
    current_user.assign_attributes(account_update_params)
    if current_user.save
      redirect_to jp_signup_address_path
    else
      render "sms_confirmation"
    end
  end

  def address
  end

  def address_create
    current_user.assign_attributes(account_update_params)
    if current_user.save
      redirect_to root_path
    else
      render "address"
    end
  end

  def registration_complete

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private
  def after_sign_up_path_for(resource)
    jp_signup_sms_confirmation_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day])
  end

  def user_sms_confirmation
    devise_parameter_sanitizer.permit(:account_update, keys: [:tel])
  end

  def user_address
    devise_parameter_sanitizer.permit(:account_update, keys: [:prefecture_code, :zip, :city_code, :street])
  end

  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) { render :new }
    end
  end

  def login_verify
    redirect_to action: :new unless user_signed_in?
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
