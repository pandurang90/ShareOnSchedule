ShareOnSchedule::Application.routes.draw do
 root :to => 'welcome#index'
  resources :tweets
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  # The priority is based upon order of creation:
  # first created -> highest priority.

  #match '/auth/:provider/callback' => 'auth#callback'
end