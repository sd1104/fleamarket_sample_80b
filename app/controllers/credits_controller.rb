class CreditsController < ApplicationController
  require 'payjp'

  def new
    credit = Credit.where(user_id: current_user.id)
    redirect_to action: "show" if credit.exists?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:private_key]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      credit: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, credit_id: customer.default_credit)
      if @credit.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    credit = Credit.where(user_id: current_user.id).first
    if credit.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:private_key]

      customer = Payjp::Customer.retrieve(credit.customer_id)
      customer.delete
      credit.delete
    end
      redirect_to action: "new"
  end

  def show
    credit = Credit.where(user_id: current_user.id).first
    if credit.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:private_key]
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