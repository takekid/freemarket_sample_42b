class CreditcardsController < ApplicationController

  def pay
    Payjp.api_key = 'sk_test_33ed6ec1e16acea820f30a16'
    customer = Creditcard.create_token(params, customer)
    @credit = Creditcard.new(user_id: current_user.id, customer_id: customer.id)
     # @customer = Payjp::Customer.retrieve(@customer.id)
     # @customer.cards.create(card:  )

    if @credit.save
      redirect_to users_finish_path
    else
      render("users/pay")   
    end
  end

end
