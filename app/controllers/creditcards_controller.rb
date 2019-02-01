class CreditcardsController < ApplicationController

  def pay
    Payjp.api_key = ENV['PAYJP_KEY']
    customer = Creditcard.create_token(params, customer)
    @credit = Creditcard.includes(:user).new(user_id: current_user.id, customer_id: customer.id)
     # @customer = Payjp::Customer.retrieve(@customer.id)
     # @customer.cards.create(card:  )

    if @credit.save
      redirect_to users_finish_path
    else
      render("users/pay")   
    end
  end

end
