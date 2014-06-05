ToDo::Application.routes.draw do

  get "welcome/lists"

  root to: 'welcome#lists'
  
end
