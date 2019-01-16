class ApplicationController < ActionController::Base
	before_action :configure_permitted_params, if: :devise_controller?


	def configure_permitted_params
		devise_parameter_sanitizer.permit(:signin_form, keys: [:email, :password, :nickname, :password_confirmation])
		devise_parameter_sanitizer.permit(:address, keys: [:postal_code, :prefectures, :city, :address, :building, :phonenumber])
	end



end
