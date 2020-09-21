Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  get '*path', to: 'home#index', format: false

  scope :api, defaults: { format: :json } do
    post '/sign_in', to: 'sessions#sign_in'
    delete '/sign_out', to: 'sessions#sign_out'
    post '/user', to: 'users#create'
    get '/check_session', to: 'users#check_session_valid'
  end
end
