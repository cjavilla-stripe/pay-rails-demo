Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#root"
  resources :payment_methods
  resources :products
  resources :cart_items
  resources :orders
  resource :subscription do
    member do
      get :manage
    end
  end

  get '/pricing', to: 'products#pricing'
end
