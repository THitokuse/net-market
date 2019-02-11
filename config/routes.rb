Rails.application.routes.draw do
  root 'test#index'
  resources :items, only: [:index, :new, :show] do
    resources :comments, only: [:create]
  end
  get 'logout' => 'mypages#logout'

end
