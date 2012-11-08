ShareOnSchedule::Application.routes.draw do
  root :to => 'welcome#index'
  match '/auth/callback' => 'auth#callback'
  resources :tweets
end