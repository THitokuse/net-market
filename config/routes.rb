Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :new, :show] do
    resources :comments, only: [:create]
  end
  resources :mypages, only: [:index, :destroy]
end
