Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  root "items#index"
  resources :items, only: [:index, :show,:create,:new, :edit, :update, :destroy] do

    collection do
      get 'sell'
      get 'search'
    end
  end
  resources :categories, only: [:index, :show,:new]
  get 'users/signin_form', to: 'users#signin_form'
  get 'users/address', to: 'users#address'
  get 'users/credit',to: 'users#credit'
  get 'users/finish', to: 'users#finish'
  get 'users/show' => 'users#show'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get 'users/sign_out' => 'users#sign_out'
  post 'users/signin_form_create', to: 'users#signin_form_create'
  post 'users/address_create', to: 'users#address_create'
  get 'users/creditcard' => 'users#creditcard'
  get 'users/card_create' => 'users#card_create'
  post '/pay', to: 'creditcards#pay'
  post 'items/:id', to: 'items#charge'
  get 'transactions/buy' => 'transactions#buy'
end
