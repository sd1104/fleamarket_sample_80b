class ProductAddressesController < ApplicationController

  def new
    @product_address = ProductAddress.new
  end

  def create
    @product_address = ProductAddress.new(product_address_params)

    if @product_address.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @product_address = ProductAddress.find(params[:id])
  end

  def update
    @product_address = ProductAddress.find(params[:id])
    if @product_address.update(product_address_params)
      redirect_to product_addresses_path
    else
      render :edit
    end
  end

  private
   def product_address_params
    params.require(:product_address).permit(
      :first_name, 
      :last_name, 
      :first_name_kana, 
      :last_name_kana, 
      :postal_code, 
      :prefecture_code, 
      :address_city, 
      :address_street, 
      :building_name, 
      :phone_number
    ).merge(user_id: 1)
   end
end
