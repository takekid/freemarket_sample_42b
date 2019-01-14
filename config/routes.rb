Rails.application.routes.draw do
  devise_for :users
  root "markets#index"
  resources :markets, only: [:index]
end
