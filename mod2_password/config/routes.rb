Rails.application.routes.draw do

  root 'home#index'

  delete '/stories/:story_id/comments/:id', to: 'comments#destroy', as: "delete"

   resources :users, :user_events
   resources :sessions, only: [:new, :create, :destroy]
   resources :stories do
     resources :comments
   end
   get 'signup', to: 'users#new', as: 'signup'
   get 'login', to: 'sessions#new', as: 'login'
   get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
