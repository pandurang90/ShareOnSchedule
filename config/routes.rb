ShareOnSchedule::Application.routes.draw do
  resources :linkedins
  resources :tweets
  root :to => 'welcome#index'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  match ':controller(/:action(/:id))(.:format)'
end