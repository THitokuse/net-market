Rails.application.routes.draw do
  get "items" => "items#index"
  root 'test#index'
end
