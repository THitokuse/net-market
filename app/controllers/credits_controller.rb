class CreditsController < ApplicationController
  protect_from_forgery except: :create

  def index
    @credit_card = Credit.find_by(user_id: current_user.id)
  end

  def new
    get_new_credit_months_years
  end

  def create
    Payjp::api_key = Rails.application.credentials.payjp_secret_key
      payjp_token = Payjp::Token.create({
        card: {
          number:    credit_params[:authorization_code],
          cvc:       credit_params[:security_code],
          exp_month: credit_params[:month],
          exp_year:  credit_params[:year],
      }},
      {
        'X-Payjp-Direct-Token-Generate': 'true'
      }
      )
    customer_token = Payjp::Customer.create(card: payjp_token)
    @credit_card = Credit.new(authorization_code: credit_params[:authorization_code], security_code: credit_params[:security_code],
      month: credit_params[:month], year: credit_params[:year], user_id: current_user.id, payjp_token: customer_token.id)
    if @credit_card.save
      render :index
    else
      get_new_credit_months_years
      render :new
    end
end

  def destroy
    credit_card = Credit.find(params[:id])
    if credit_card.user_id == current_user.id
      credit_card.destroy
    end
    redirect_to credits_path
  end

  private

  def credit_params
    params.require(:credit).permit(:authorization_code, :security_code, :month, :year).merge(user_id: current_user.id)
  end

  def get_new_credit_months_years
    @credit_card = Credit.new
    @months = Credit.get_months
    @years = Credit.get_years
  end

  def crate_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create(
      card: {
        number: number,
        cvc:    cvc,
        exp_month: exp_month,
        exp_year: exp_year,
      }
    )
    return token.id
  end
end