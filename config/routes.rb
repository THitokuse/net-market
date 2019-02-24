Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    # 新規登録関連のパス
    get 'jp/signup' => 'users/registrations#index'
    get 'jp/signup/registration' => 'users/registrations#new'
    post 'jp/signup/registration' => 'users/registrations#create'
    get 'jp/signup/sms_confirmation' => 'users/registrations#sms_confirmation'
    patch 'jp/signup/sms_confirmation' => 'users/registrations#sms_confirmation_create'
    get 'jp/signup/address' => 'users/registrations#address'
    patch 'jp/signup/address' => 'users/registrations#address_create'

    # ログイン関連のパス
    get 'jp/login' => 'users/sessions#new'
    post 'jp/login' => 'users/sessions#create'
  end

  root 'items#index'

  resources :items, only: [:index, :new, :show] do
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
