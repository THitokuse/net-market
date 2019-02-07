Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'jp/signup' => 'users/registrations#index'
    get 'jp/signup/registration' => 'users/registrations#new'
    get 'jp/signup/sms_confirmation' => 'users/registrations#sms_confirmation'
  end
  root 'test#index'
  resources :items, only: :index
end
