Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#root"
  resources :payment_methods
end
