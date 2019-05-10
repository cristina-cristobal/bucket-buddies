Rails.application.routes.draw do
  resources :goal_categories
  resources :categories
  resources :goals do
    resources :likes, only: [:new]
  end
  resources :likes, except: [:new] do
    resources :steps, only: [:new]
  end
  resources :steps, except: [:new]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  # get "/goals/:id/add", to: "goals#edit", as: "add"
  get '/', to: "home#home", as: "home"
  # get 'likes/:id/steps/add', to: "likes#edit", as: "add_step"
end
