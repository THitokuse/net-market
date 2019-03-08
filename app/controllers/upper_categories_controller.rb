class UpperCategoriesController < ApplicationController
  def index
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])

    respond_to do |format|
      format.json
    end
  end

  def show
    @category = UpperCategory.find(params[:id])
    @items = @category.items.page(params[:page]).per(20)
  end
end
