Rails.application.routes.draw do
  root 'test#index'
  resources :items, only: [:index, :new]
  get 'logout' => 'mypages#logout'

end
