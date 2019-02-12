Rails.application.routes.draw do
<<<<<<< HEAD
  root 'test#index'
  resources :items, only: [:index, :new, :show, :purchase_concern] do
=======
  root 'items#index'
  resources :items, only: [:index, :new, :show] do
>>>>>>> master
    resources :comments, only: [:create]
      member do
        get "purchase_concern"
      end
  end
  resources :mypages, only: [:index, :destroy]
end
