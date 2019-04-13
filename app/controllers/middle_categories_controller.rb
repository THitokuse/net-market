class MiddleCategoriesController < ApplicationController
  def index
    @middle_categories = MiddleCategory.all.where(upper_category_id: params[:upper_category_id])

    respond_to do |format|
      format.json
    end
  end

  def show
    @category = MiddleCategory.find(params[:id])
    @items = @category.items.page(params[:page]).per(20)
  end
end
