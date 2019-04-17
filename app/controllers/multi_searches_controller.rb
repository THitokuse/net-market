class MultiSearchesController < ApplicationController
  before_action :item_setting, only: :index
  before_action :set_items, only: :index

  def index
    @new_items = @selling_items.limit(20)
    @search = Item.ransack(params[:q])
    @items = @search.result.includes(:upper_category).page(params[:page]).per(20)
  end

  private
    def item_setting
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])
    @sizes = Size.all.where('size_type_id = ?', 1)
    @delivery_burdens = DeliveryBurden.all
    @conditions = Condition.all
    @statuses = Status.all
  end
end
