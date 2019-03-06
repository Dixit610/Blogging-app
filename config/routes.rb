Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs
  root to:'homes#index'
  get '/profile',to:'homes#user_profile',as:'profile'
  post '/notification', to:'homes#user_notification', as:'notification'
 resources :blogs do
 	resources :likes
 	resources :comments
 end
end
