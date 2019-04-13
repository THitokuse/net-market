class BrandsController < ApplicationController
  def index
    @brands = Brand.all.where('name LIKE(?)', "%#{params[:name]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @items = @brand.items.page(params[:page]).per(20)
  end
end
