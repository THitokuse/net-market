Rails.application.routes.draw do
  root 'test#index'
  resources :items, only: :index
end
