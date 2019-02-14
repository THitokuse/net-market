class MypagesController < ApplicationController
  def index
  end

  def identify
    @item = Item.new
  end

  def destroy
  end
end
