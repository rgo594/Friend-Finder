Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'home#index'

  delete '/stories/:story_id/comments/:id', to: 'comments#destroy', as: "delete"

  delete '/events/leave_event', to: 'events#leave_event'
  delete '/users/unfollow', to: 'users#unfollow'
  post '/events/join_event', to: 'events#join_event'
  post '/users/add_friend', to: 'users#add_friend'
  post '/events/add_follower', to: 'events#follow_event'
  get '/users/my_friends', to: 'users#my_friends'
  get '/events/my_events', to: 'events#my_events'



  resources :users, :user_events, :events
  resources :sessions, only: [:new, :create, :destroy]
     resources :stories do
     resources :comments
   end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
