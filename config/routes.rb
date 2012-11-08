ShareOnSchedule::Application.routes.draw do
  root :to => 'auth#index'
  match '/auth/:provider/callback' => 'auth#callback'
  match '/auth/callback' => 'auth#callback'
end