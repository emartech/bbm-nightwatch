Rails.application.routes.draw do
  namespace :admin do
    resources :donations
    resources :target_locations
    resources :transports
    resources :users

    root to: "donations#index"
  end

  devise_for :users

  resources :donations, only: [:new, :create, :show, :index] do
    get :thank_you, on: :collection
    resources :transports, only: [:new, :create]
  end

  resources :transports, only: [:index] do
    member do
      get :close
      patch :finish
    end
  end

  get '/healthcheck', to: 'health_check#index'

  root to: 'pages#home'
end
