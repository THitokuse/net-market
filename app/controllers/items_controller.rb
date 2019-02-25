class ItemsController < ApplicationController
  before_action :set_locale
<<<<<<< HEAD
  before_action :move_to_index, except: [:index, :show]
=======
<<<<<<< HEAD
  before_action :move_to_index, except: [:index, :show] ## テストでリダイレクトが呼ばれないようにしている
=======
  before_action :move_to_index, except: [:index, :show]
>>>>>>> c04843a3fab49d8e4546a44217ca8e62556a14fe
>>>>>>> master

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])
<<<<<<< HEAD
=======
<<<<<<< HEAD
    @middle_categories = MiddleCategory.all.where(upper_category_params)
    @lower_categories = LowerCategory.all.where(middle_category_params)
    @size = Size.all
=======
>>>>>>> master
    @middle_categories = MiddleCategory.all.where(upper_category_id: params[:upper_category_id])
    @lower_categories = LowerCategory.all.where(middle_category_id: params[:middle_category_id])
    @sizes = Size.all.where(size_type_id: params[:size_type_id])
    @delivery_methods = DeliveryMethod.all

    respond_to do |format|
      format.html
      format.json
    end
<<<<<<< HEAD
=======
>>>>>>> c04843a3fab49d8e4546a44217ca8e62556a14fe
>>>>>>> master
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

  def upper_category_params
    params.permit(:upper_category_id)
  end

  def middle_category_params
    params.permit(:middle_category_id)
  end

  def item_params
    params.require(:item).permit(:name, :price, :prefecture_code, :content, :status, :upper_category_id, :middle_category_id, :lower_category_id, :size_id, :brand_id, :delivery_burden_id, :delivery_date_id, :delivery_method_id, item_images_attributes: [{image: []}]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
