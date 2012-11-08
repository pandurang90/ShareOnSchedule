ShareOnSchedule::Application.routes.draw do
  root :to => 'welcome#index'
  resources :tweets
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}    
end