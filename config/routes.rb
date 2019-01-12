Rails.application.routes.draw do
  root "markets#index"
  resources :markets, only: [:index]
end
