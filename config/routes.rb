Rails.application.routes.draw do

  get "top_media/index"
  
  root to: "top_media#index"
  
  resources :works do 
    resources :votes, only: [:index]
  end

  resources :users do 
    resources :votes, only: [:index, :update]
  end 

  #resources :votes, only: [:index, :update]

end
