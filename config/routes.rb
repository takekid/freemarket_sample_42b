Rails.application.routes.draw do
  devise_for :users
  root "markets#index"
  resources :markets, only: [:index,:show]
  get 'users/signin_form' => 'users#signin_form'
  get 'users/address' => 'users#address'
  get 'users/credit' => 'users#credit'
  get 'users/finish' => 'users#finish'
  get 'users/show' => 'users#show'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get 'users/sign_out' => 'users#sign_out'

  get 'items/sell'   => 'items#sell'

  get 'transactions/buy' => 'transactions#buy'
end
