class LikesController < ApplicationController
  
  def index
    @items = Like.where(user_id: current_user.id).all.order("created_at DESC")
  end
  
  def create
    @like = current_user.likes.create(item_id: params[:item_id])
    redirect_back(fallback_location: root_path)
  end


end
