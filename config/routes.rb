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
  resources :items, only: :index
end
