Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/healthcheck', to: 'health_check#index'

  root to: 'health_check#index'
end
