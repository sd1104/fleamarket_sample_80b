class UsersController < ApplicationController

  def logout
  end

  def item_exhibiting
    @items_exhibiting = Item.includes(:item_images).where(seller_id: current_user.id, buyer_id: nil)
  end

  def item_sold
    @items_sold = Item.includes(:item_images).where(seller_id: current_user.id).where.not(buyer_id: current_user.id, buyer_id: nil)
  end

  def item_purchaced
    @items_purchaced = Item.includes(:item_images).where(buyer_id: current_user.id)
  end
  
end
