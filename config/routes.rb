Rails.application.routes.draw do
  namespace :api do
    resources :users
    post 'user/:id'=> 'users#create'
    get 'typehead/:term'=>"users#index"
  end
end
