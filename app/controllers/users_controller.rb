class UsersController < ApplicationController
  def signin_form
   @user = User.new
  end

  def address; end


  def credit; end

  def finish; end

  def signin_form_create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_address_path
    else
      @user = User.new(user_params)
      render("signin_form")
    end
  end

  def address_create
    @address = Address.new(address_params)
    if @address.save
       redirect_to users_credit_path
    else
      @address = Address.new(address_params)
      render("purchase")
    end
  end

  def pay
    Payjp.api_key = 'sk_test_33ed6ec1e16acea820f30a16'
    
    token = Payjp::Token.create({
  :card => {
    :number => params[:number],
    :cvc => params[:cvc],
    :exp_month => params[:exp_month],
    :exp_year => params[:exp_year]
    }},
    {
    'X-Payjp-Direct-Token-Generate': 'true'
    } 
  )
  customer = Payjp::Customer.create(
      card: token.id
      )
   binding.pry
   @credit = Creditcard.new(user_id: current_user.id, token_id: customer.id)
   if @credit.save
      redirect_to users_finish_path
   else
      render("users/pay")   
   end   
  end


  private
  def user_params
    params.permit(:nickname, :email, :password, :password_confirmation)
  end

  def address_params
    params.permit(:postal_code, :prefectures, :city, :address, :building, :phonenumber, :first_name, :last_name, :kana_first_name, :kana_last_name)
  end

  def profile
  end

  def identification
  end

  def sign_out
  end

  def creditcard
  end

  def card_create
  end

end

