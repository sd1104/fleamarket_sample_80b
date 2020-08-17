class CreditsController < ApplicationController
  require 'payjp'

  def new
    credit = Credit.where(user_id: current_user.id)
    redirect_to action: "show" if credit.exists?
  end

  # def create
  #   binding.pry
  #   Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_PRIVATE_KEY)        # PAYJPとの通信開始
  #   if params["payjp-token"].blank?                 # "payjp-token" PAYJPとの通信でトークンが入ったparams
  #     redirect_to action: "new"
  #   else
  #     customer = Payjp::Customer.create(
  #       description: "登録テスト",
  #       metadata: {user_id: current_user.id},
  #       card: params["payjp-token"]                 # "payjp-token" PAYJPとの通信でトークンが入ったparams
  #     )
  #     @card = Credit.new(user_id: current_user.id, customer_id: customer.id, credit_id: customer.default_card)
  #     if @card.save
  #       redirect_to user_credit_path(current_user.id)
  #     else
  #       redirect_to action: "new"
  #     end
  #   end
  # end

  def pay
    Payjp.api_key = Rails.application.credentials.config[:payjp][:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # binding.pry
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, credit_id: customer.default_card)
      if @credit.save
        redirect_to users_path
      else
        redirect_to action: "pay"
      end

    end
  end

  def delete
    credit = Credit.where(user_id: current_user.id).first
    if credit.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]

      customer = Payjp::Customer.retrieve(credit.customer_id)
      customer.delete
      credit.delete
    end
      redirect_to action: "new"
  end

  def show
    credit = Credit.where(user_id: current_user.id).first
    @user = User.find(params[:user_id])
    if credit.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.config[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(credit.customer_id)
      @default_credit_information = customer.cards.retrieve(credit.credit_id)
    end
  end

  def deleteData
    credit = Credit.where(user_id: current_user.id).first
    credit.delete
    redirect_to user_path(current_user.id)
  end
end