class BrandsController < ApplicationController
  def index
    @brands = Brand.all.where('name LIKE(?)', "%#{params[:name]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
end
