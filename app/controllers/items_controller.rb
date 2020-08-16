class ItemsController < ApplicationController
  before_action :move_to_index, only: :new
  before_action :get_user_item, only: [ :edit, :show, :destroy ]
  def index
    @items = Item.includes(:item_images).order("created_at DESC")
  end

  def new 
    @item =Item.new
    @item.item_images.build
    @item.item_images.build
    @item.item_images.build
    @item.item_images.build
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
    @itemcategory = Category.where(ancestry: nil)
    @childrencategory = @item.category.parent.parent.children
    @grandchildrencategory = @item.category.parent.children
  end

  def update
  end

  def show
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
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
    params.require(:item).permit(:name, :introduction, :price, :condition_id, :delivery_charge_id, :delivery_origin_id, :delivery_date_id, :brand, :category_id, item_images_attributes: [:image, :id, :_destory]).merge(seller_id: current_user.id)
  end

  def get_user_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_category_sellector
    @itemcategory = Category.where(ancestry: nil).pluck(:name).unshift("選択してください")
  end
end
