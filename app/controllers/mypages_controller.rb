class MypagesController < ApplicationController
  def index
  end

  def identify
    @item = Item.new
  end

  def destroy
  end

  def edit
  end

  def item_listing
    @items = current_user.items
  end
end