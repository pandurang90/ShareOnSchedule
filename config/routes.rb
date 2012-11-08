ShareOnSchedule::Application.routes.draw do
  root :to => 'welcome#index'
  resources :tweets
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  match '/auth/:provider/callback' => 'auth#callback'
  match '/auth/linkedin' => 'auth#callback'
  match '/oauth/linkedin' => 'auth#callback'
  match '/auth/linkedin/callback' => 'auth#callback'
end