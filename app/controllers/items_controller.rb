class ItemsController < ApplicationController

  before_action :set_locale
  before_action :set_items
  before_action :one_item_setting, only: [:show, :edit, :update, :destroy, :purchase_concern, :sell_item]
  before_action :move_to_index, except: [:index, :show]
  protect_from_forgery except: :update
  before_action :item_setting, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :show, :purchase_concern]

  def index
    @items = @selling_items.limit(4)
    @ladies_items = @items.where('upper_category_id = ?', 1)
    @mens_items = @items.where('upper_category_id = ?', 2)
  end

  def new
    @item = Item.new

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
    @comment = Comment.new
    @items = @selling_items.where(user_id: @item.user.id).where.not(id: @item.id)
    @brand_items = @selling_items.where(brand_id: @item.brand.id).where.not(id: @item.id)
  end

  def edit
    @item.item_images.each do |img|
      @image = img.image
    end
  end

  def update
    if @item.user_id == current_user.id
      @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to item_listing_mypages_path, notice: '商品を削除しました'
    end
  end

  def purchase_concern
    @credit_card = Credit.find_by(user_id: current_user.id)
  end

  def sell_item
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :prefecture_code, :content, :upper_category_id, :middle_category_id, :lower_category_id, :size_id, :brand_id, :delivery_burden_id, :delivery_date_id, :delivery_method_id, :status_id, :condition_id, :purchase_status, item_images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

  def one_item_setting
    @item = Item.find(params[:id])
  end


  def item_setting
    @delivery_methods = DeliveryMethod.all
    @delivery_burdens = DeliveryBurden.all
    @conditions = Condition.all
    @statuses = Status.all
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
