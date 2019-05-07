Rails.application.routes.draw do
  resources :likes
  resources :goal_categories
  resources :categories
  resources :steps
  resources :goals, except: [:edit]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/goals/:id/add", to: "goals#edit", as: "add"

end
