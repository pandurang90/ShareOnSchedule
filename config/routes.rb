require 'sidekiq/web'
ShareOnSchedule::Application.routes.draw do
  resources :linkedins
  resources :tweets
  resources :fb_posts
  root :to => 'welcome#index'
  get '/home' => "home#index"
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  match ':controller(/:action(/:id))(.:format)'
  match '/about_us', :to => 'welcome#about_us'
  mount Sidekiq::Web, at: "/sidekiq"
end