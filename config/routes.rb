Rails.application.routes.draw do
  devise_for :users
  root "markets#index"
  resources :markets, only: [:index]
  get 'users/show' => 'users#show'
  get 'users/profile' => 'users#profile'
  get 'items/sell'   => 'items#sell'
  get 'users/signin_form', to: 'users#signin_form'
  get 'users/address', to: 'users#address'
  get 'users/purchase', to: 'users#purchase'
  get 'users/finish', to: 'users#finish'
  post 'users/signin_form_create', to: 'users#signin_form_create'
  post 'users/address_create',to: 'users#address_create'
  post 'purchase', to: 'users#purchase'
  
end
