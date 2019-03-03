class CreditsController < ApplicationController
  protect_from_forgery except: :create
  def index
  end

  def new
    @credit = Credit.new
  end

  def create
    # binding.pry
    # @credit = Credit.create(credit_params)
    # Payjp.api_key = Rails.application.credentials.payjp_secret_key
    # Payjp::Charge.create(currency: 'jpy', amount: 1000, card: params['payjp-token'])
    # redirect_to root_path, notice: "支払いが完了しました"
  end

  private
  def credit_params
    params.permit(:number,:cvc,:exp_month, :exp_year).merge(user_id: current_user.id)
  end
end