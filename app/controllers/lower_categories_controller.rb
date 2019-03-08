class LowerCategoriesController < ApplicationController
  def index
    @lower_categories = LowerCategory.all.where(middle_category_id: params[:middle_category_id])

    respond_to do |format|
      format.json
    end
  end

  def show
    @category = LowerCategory.find(params[:id])
    @items = @category.items.page(params[:page]).per(20)
  end
end
