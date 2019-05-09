Rails.application.routes.draw do

  root 'home#index'
  post 'users/add_friend', to: 'users#add_friend'
  get '/users/my_friends', to: 'users#my_friends'
  get '/events/my_events', to: 'events#my_events'
  resources :users, :user_events, :events
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
