class ItemsController < ApplicationController
  def index
    @items = Item.includes(:image).order("created_at DESC")
  end

  def new 
    @item =Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to root_path(@item)
    else
      flash.now[:alert] = "必須項目を入力してください"
      render :new
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def show
  end

  def destroy
    if @item.seller.id == current_user.id
      if @item.destroy
        redirect_to root_path, notice: "削除が完了しました"
      else
        redirect_to root_path, alert: "削除が失敗しました"
      end
    else
      redirect_to root_path, alert: "ユーザーが一致していません"
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :condition_id, :delivery_charge_id, :derivery_origin_id, :delivery_date_id, :brand, :category_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

end
