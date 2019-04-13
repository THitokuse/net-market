class SizesController < ApplicationController

  def index
    @sizes = Size.all.where(size_type_id: params[:size_type_id])

    respond_to do |format|
      format.json
    end
  end
end
