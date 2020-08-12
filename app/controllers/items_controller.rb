class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images).order("created_at DESC")
  end

  def new 
    @item =Item.new
    @item.item_images.build

    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
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
    if @item.seller_id == current_user.id
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
    params.require(:item).permit(:name, :introduction, :price, :condition_id, :delivery_charge_id, :delivery_origin_id, :delivery_date_id, :brand, :category_id, item_images_attributes: [:image, :item, :id]).merge(seller_id: current_user.id)
  end

  def set_category
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end


end
