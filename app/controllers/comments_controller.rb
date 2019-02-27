class CommentsController < ApplicationController
  before_action :move_to_index, only: [:create]

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)
    if @comment.save
      redirect_to items_path
    else
      render item_path(@item)
    end
  end

  private
  def comment_params
    params.permit(:comment).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
