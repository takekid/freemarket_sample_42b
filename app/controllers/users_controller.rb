class UsersController < ApplicationController
  def signin_form
   @user = User.new
  end

  def address; end

  def purchase; end

  def finish; end

  def signin_form_create
  	
  	@user = User.new(user_params)
  	if @user.save
  		 redirect_to("/users/address")
  	else
      @user = User.new(user_params)
      render("signin_form")
  	end
  end

  def address_create
    @address = Address.new(address_params)
    binding.pry
    if @address.save
       redirect_to("/users/credit")
    else
      @address = Address.new(address_params)
      render("purchase")
    end
  end

  private
  def user_params
  	params.permit(:nickname, :email, :password, :password_confirmation)
  	
  end

  def address_params
    params.permit(:postal_code, :prefectures, :city, :address, :building, :phonenumber)
    
  end

  # def purchase
  #   Payjp.api_key = PAYJP_SECRET_KEY
  #   Payjp::Charge.new(currency: 'jpy', amount: 1000, card: params['token_id'])
  #   if Payjp::Charge.save
  #      redirect_to root_path, notice: "支払いが完了しました"
  #      redirect_to("/users/finish")
  #   else

  #   end  

  # end




end
