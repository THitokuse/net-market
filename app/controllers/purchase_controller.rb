class PurchaseController < ApplicationController
  before_action :set_variable

  def create
    ActiveRecord::Base.transaction do
      Payjp::api_key = Rails.application.credentials.payjp_secret_key
      if @item.purchase_status == 1
        if @credit_card.payjp_token.nil?
          customer_token = Payjp::Customer.create(card: payjp_params[:payjp_token])
          @credit_card.update(payjp_token: customer_token[:id]) if @credit_card.user_id == current_user.id
          purchased_and_change_item_purchase_status(@item, @credit_card)
          redirect_to credits_path, alert: '商品の購入を完了しました'
        else
          purchased_and_change_item_purchase_status(@item, @credit_card)
          redirect_to credits_path, alert: '商品の購入を完了しました'
        end
      else
        raise
      end
    end
    # ＃ 購入処理失敗
    rescue => e
      redirect_to root_path, alert: '商品の購入に失敗しました'
  end


  private

  def payjp_params
    params.permit(:id, :payjp_token)
  end

  def set_variable
    @item = Item.find(params[:id])
    @credit_card = Credit.find_by(user_id: current_user.id)
  end

  def purchased_and_change_item_purchase_status(item, card)
    # [first_or_create]検索条件に合致するレコードが存在する場合にはそのレコードを参照し、無ければ検索条件の内容で新しいレコードを新規保存
    partner = TradingPartner.where(seller_id: item.user_id, buyer_id: current_user.id).first_or_create
    Order.create(item_id: payjp_params[:id], trading_partner_id: partner.id)
    item.update(purchase_status: 2)
    Payjp::Charge.create(
        amount:   item.price.to_i,
        customer: card.payjp_token,
        currency: 'jpy'
    )
  end
end
