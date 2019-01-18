Rails.application.routes.draw do
  devise_for :users
  root "markets#index"
  resources :markets, only: [:index]
  get 'users/signin_form' => 'users#signin_form'
  get 'users/adress' => 'users#adress'
  get 'users/credit' => 'users#credit'
  get 'users/finish' => 'users#finish'
  get 'users/show' => 'users#show'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'

  get 'items/sell'   => 'items#sell'

  get 'transactions/buy' => 'transactions#buy'
end
