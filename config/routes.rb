Rails.application.routes.draw do

  resources :categories, expect: :show  
  resources :articles 
  resources :home, path:"/"
   
end
