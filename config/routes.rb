ShareOnSchedule::Application.routes.draw do
  root :to => 'welcome#index'
  resources :tweets
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  match '/auth/:provider/callback' => 'auth#callback'
  match '/auth/callback' => 'auth#callback'
end