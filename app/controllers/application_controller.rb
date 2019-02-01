class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show, :signin_form, :address, :credit]

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :nickname, :password_confirmation])
    # devise_parameter_sanitizer.permit(:address, keys: [:postal_code, :prefectures, :city, :address, :building, :phonenumber, :first_name, :last_name, :kana_first_name, :kana_last_name])
  end

  def after_sign_in_path_for(resource)
      users_address_path
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
