class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
	

	def configure_permitted_params
		devise_parameter_sanitizer.permit(:signin_form, keys: [:email, :password, :nickname, :password_confirmation])
		devise_parameter_sanitizer.permit(:address, keys: [:postal_code, :prefectures, :city, :address, :building, :phonenumber])
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
