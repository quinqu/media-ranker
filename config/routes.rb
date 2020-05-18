Rails.application.routes.draw do

  get "top_media/index"
  
  root to: "top_media#index"

  get "/login", to: "users#login_form", as: "login"
  
  post "/login", to: "users#login"
  
  post "/logout", to: "users#logout", as: "logout"
  get "/users/current", to: "users#current", as: "current_user"
  
  resources :works do 
    resources :votes, only: [:index]
  end

  resources :users do 
    resources :votes, only: [:index]
  end 

  # resources :votes do 
  #   resources :users, only: [:index, :show]
  # end 


  get "/upvote/", to: "votes#upvote", as: "upvote"



end
