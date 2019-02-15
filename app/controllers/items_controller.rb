class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

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

  private
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
