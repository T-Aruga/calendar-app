Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  get '*path', to: 'home#index', format: false
end
