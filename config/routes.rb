ToDo::Application.routes.draw do

  devise_for :users
  get "welcome/lists"

  resources :lists do 
    resources :items, only: [:show, :create, :destroy]
  end

  root to: 'welcome#lists' 
end



