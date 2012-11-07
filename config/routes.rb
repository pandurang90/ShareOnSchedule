ShareOnSchedule::Application.routes.draw do
  root :to => 'auth#index'
  match '/auth/callback' => 'auth#callback'
end