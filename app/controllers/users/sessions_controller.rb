# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protect_from_forgery except: :create
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end
end
