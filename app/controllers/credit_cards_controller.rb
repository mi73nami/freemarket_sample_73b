class CreditCardsController < ApplicationController
  require "payjp"

  def new
    card = CreditCard.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def index
    
  end

  def create
    # binding.pry
    Payjp.api_key = 'sk_test_89a1f204dd73c629f410f646'

    if params['payjp-token'].blank?
      redirect_to root_path

    else
      customer = Payjp::Customer.create(
        description: 'test',
        card_token: params['payjp-token'],
        card_number: params['card_number'],
        exp_month: params['exp_month'],
        exp_year: params['exp_year'],
        cvc: params['cvc'],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, token: params['payjp-token'])
      binding.pry
      if @card.save
        redirect_to action: "index"
      else
        redirect_to root_path
      end
    end
  end

end
