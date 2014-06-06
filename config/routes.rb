ToDo::Application.routes.draw do

  get "welcome/lists"

  resources :lists

  root to: 'welcome#lists'
  
end
