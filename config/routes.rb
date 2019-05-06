Rails.application.routes.draw do
  resources :likes
  resources :goal_categories
  resources :categories
  resources :steps
  resources :goals
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
