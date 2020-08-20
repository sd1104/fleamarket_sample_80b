class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/items/#{@comment.item.id}"
    else
      redirect_to item_path(@comment.item.id), notice: "コメントが未入力もしくは100文字を超えています"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
