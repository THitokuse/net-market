class UpperCategoriesController < ApplicationController
  def index
    @upper_categories = UpperCategory.all.includes([middle_categories: :lower_categories])

    respond_to do |format|
      format.json
    end
  end
end
