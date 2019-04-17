class SimpleSearchesController < ApplicationController
  before_action :item_setting, only: :index
    before_action :set_items, only: :index

  def index
    @keyword = params[:keyword]
    @items = @selling_items.where('name LIKE(?) OR content  LIKE(?)',"%#{params[:keyword]}%","%#{params[:keyword]}%").page(params[:page]).per(20)
    @search = Item.ransack(params[:q])
    @new_items = Item.order("created_at DESC").limit(20)
  end

  private
    def item_setting
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])
    @sizes = Size.where('size_type_id = ?', 1)
    @delivery_burdens = DeliveryBurden.all
    @conditions = Condition.all
    @statuses = Status.all
  end
end
