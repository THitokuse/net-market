Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
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
    get 'jp/signup/complete' => 'users/registrations#registration_complete'

    # ログイン関連のパス
    get 'jp/login' => 'users/sessions#new'
    post 'jp/login' => 'users/sessions#create'
  end

  root 'items#index'
  resources :items do
    resources :comments, only: [:create]
      member do
        get "purchase_concern"
        get "sell_item"
      end
  end
  resources :mypages, only: [:index, :destroy, :edit] do
    collection do
      get "identify"
      get "item_listing"
    end
    member do
      get "card_registration"
    end
  end

  resources :brands, only: [:index]
end

