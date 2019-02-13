class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def show
    @item = Item.find(1)
    @comment = Comment.new
    @items = Item.all
  end

  def purchase_concern
    @item = Item.find(1)
  end
end
