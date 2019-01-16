Rails.application.routes.draw do
  devise_for :users
  root "markets#index"
  resources :markets, only: [:index]
  get 'users/signin_form' => 'users#signin_form'
  get 'users/address' => 'users#address'
  get 'users/purchase' => 'users#purchase'
  get 'users/finish' => 'users#finish'
  post 'users/signin_form_create' => 'users#signin_form_create'
  post 'users/address_create' => 'users#address_create'
  post 'purchase' => 'users#purchase'
  
end
