class ItemsController < ApplicationController

  before_action :set_locale
  before_action :move_to_index, except: [:index, :show]
  protect_from_forgery except: :update

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
    @item = Item.find(params[:id])
    @comment = Comment.new
    @items = Item.all.where(user_id: @item.user.id).where.not(id: @item.id)
    @brand_items = Item.all.where(brand_id: @item.brand.id).where.not(id: @item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def search
    @keyword = params[:keyword]
    @items = Item.where('name LIKE(?) OR content  LIKE(?)',"%#{params[:keyword]}%","%#{params[:keyword]}%").limit(20)
  end

  def update
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to item_listing_mypages_path, notice: '商品を削除しました'
    end
  end

  def purchase_concern
    @item = Item.find(params[:id])
    @credit_card = Credit.find_by(user_id: current_user.id)
  end

  def sell_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :prefecture_code, :content, :status, :upper_category_id, :middle_category_id, :lower_category_id, :size_id, :brand_id, :delivery_burden_id, :delivery_date_id, :delivery_method_id, :purchase_status, item_images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end


  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
