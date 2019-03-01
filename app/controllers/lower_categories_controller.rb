class LowerCategoriesController < ApplicationController
  def index
    @lower_categories = LowerCategory.all.where(middle_category_id: params[:middle_category_id])

    respond_to do |format|
      format.json
    end
  end
end
