class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new 
    @item =Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to root_path
    else
      flash.now[:alert] = "必須項目を入力してください"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition, :delivery_charge, :derivery_origin, :delivery_date, :brand, :category_id).merge(seller_id: current_user.id)
  end

end
