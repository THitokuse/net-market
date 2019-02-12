Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :new, :show] do
    resources :comments, only: [:create]
      member do
        get "purchase_concern"
      end
  end
  resources :mypages, only: [:index, :destroy]
end
