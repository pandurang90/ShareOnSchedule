ShareOnSchedule::Application.routes.draw do
  root :to => 'auth#index' # linkedin (ANY ONE NEEDS TO BE SET AS DEFAULT)
  root :to => 'welcome#index' # app (ANY ONE NEEDS TO BE SET AS DEFAULT)
  match '/auth/:provider/callback' => 'auth#callback'
  match '/auth/callback' => 'auth#callback'
  match '/auth/:provider/callback' => 'welcome#index'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
end

# TODO
# ROOT_TO PATH SHOULD BE SET FOR ANY ONE.