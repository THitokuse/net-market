class ItemsController < ApplicationController

  before_action :set_locale
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])
    @middle_categories = MiddleCategory.all.where(upper_category_id: params[:upper_category_id])
    @lower_categories = LowerCategory.all.where(middle_category_id: params[:middle_category_id])
    @sizes = Size.all.where(size_type_id: params[:size_type_id])
    @delivery_methods = DeliveryMethod.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(1)
    @comment = Comment.new
    @items = Item.all
  end

  def purchase_concern
    @item = Item.find(1)
  end

  private
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
