Rails.application.routes.draw do
  root 'test#index'
  resources :items, only: [:index, :new]
  get 'logout' => 'mypages#logout'
  get 'mypage' => 'mypages#mypage'
end
