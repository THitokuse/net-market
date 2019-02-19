Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'jp/signup' => 'users/registrations#index'
    get 'jp/signup/registration' => 'users/registrations#new'
    post 'jp/signup/registration' => 'users/registrations#create'
    get 'jp/signup/sms_confirmation' => 'users/registrations#sms_confirmation'

    get 'jp/login' => 'users/sessions#new'
  end

  root 'items#index'
  resources :items, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
      member do
        get "purchase_concern"
      end
  end
  resources :mypages, only: [:index, :destroy, :edit] do
    collection do
      get "identify"
    end
  end
end
