class CreditsController < ApplicationController
  require 'payjp'

  before_action :set_credit, only: [:show, :delete]

  def new
    credit = Credit.where(user_id: current_user.id)
    redirect_to action: "show" if credit.exists?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.config[:payjp][:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, credit_id: customer.default_card)
      if @credit.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end

    end
  end

  def show
    if @credit.blank?
      @credit = Credit.new 
    else
      Payjp.api_key = Rails.application.credentials.config[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @default_card_information = customer.cards.retrieve(@credit.credit_id)
    end
  end

  def delete
    if @credit.present?
      Payjp.api_key = Rails.application.credentials.config[:payjp][:PAYJP_SECRET_KEY]

      customer = Payjp::Customer.retrieve(@credit.customer_id)
      customer.delete
      @credit.delete
    end
      redirect_to action: "show"
  end

  private

  def set_credit
    @credit = Credit.find_by(user_id: current_user.id)
  end

end