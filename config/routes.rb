Rails.application.routes.draw do
  root 'test#index'
  resources :items, only: [:index, :new, :show, :purchase_concern] do
    resources :comments, only: [:create]
      member do
        get "purchase_concern"
      end
  end
  get 'logout' => 'mypages#logout'

end
