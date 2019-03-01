class ItemsController < ApplicationController

  before_action :set_locale
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
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
    @item = Item.find(params[:id])
    @comment = Comment.new
    @items = Item.all.where(user_id: @item.user.id).where.not(id: @item.id)
    @brand_items = Item.all.where(brand_id: @item.brand.id).where.not(id: @item.id)
  end

  def purchase_concern
    @item = Item.find(1)
  end

  private

  def upper_category_params
    params.permit(:upper_category_id)
  end

  def middle_category_params
    params.permit(:middle_category_id)
  end

  def item_params
    params.require(:item).permit(:name, :price, :prefecture_code, :content, :status, :upper_category_id, :middle_category_id, :lower_category_id, :size_id, :brand_id, :delivery_burden_id, :delivery_date_id, :delivery_method_id, item_images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
