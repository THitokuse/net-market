class CreditsController < ApplicationController
  protect_from_forgery except: :create

  def index
    @credit_card = Credit.find_by(user_id: current_user.id)
  end

  def new
    get_new_credit_months_years
  end

  def create
    @credit_card = Credit.new(credit_params)
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
end