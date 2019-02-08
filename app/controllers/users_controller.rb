class UsersController < ApplicationController
  def address; end

  def credit; end

  def finish; end

  def signin_form
   @user = User.new
   if verify_recaptcha(model: @user) && @user.save
      redirect_to root_path
    else
      new_user_session_path
    end
  end

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
      render("address")
    end
  end

  def credit_update
    Payjp.api_key = ENV['PAYJP_KEY']
    @creditcard = Creditcard.includes(:user).where(user_id: current_user.id)
    card = Payjp::Customer.retrieve(@creditcard[0].customer_token)
    customer = Payjp::Customer.retrieve(card.id)
    User.add_token(card, customer,params)
    redirect_to root_path
  end


  def show
    @search = Item.ransack(params[:q])
    @items = @search.result.includes(:brand, :category)
  end

  def profile
    @search = Item.ransack(params[:q])
    @items = @search.result.includes(:brand, :category)
  end

  def identification
    @search = Item.ransack(params[:q])
    @items = @search.result.includes(:brand, :category)
  end

  def sign_out
    @search = Item.ransack(params[:q])
    @items = @search.result.includes(:brand, :category)
  end

  def creditcard
    @search = Item.ransack(params[:q])
    @items = @search.result.includes(:brand, :category)
  end

  def card_create
    @search = Item.ransack(params[:q])
    @items = @search.result.includes(:brand, :category)
  end

  private
  def user_params
    params.permit(:nickname, :email, :password, :password_confirmation)
  end

  def address_params
    params.permit(:postal_code, :prefectures, :city, :address, :building, :phonenumber, :first_name, :last_name, :kana_first_name, :kana_last_name).merge(user_id: current_user.id)
  end

end

