class MiddleCategoriesController < ApplicationController
  def index
    @middle_categories = MiddleCategory.all.where(upper_category_id: params[:upper_category_id])

    respond_to do |format|
      format.json
    end
  end
end
