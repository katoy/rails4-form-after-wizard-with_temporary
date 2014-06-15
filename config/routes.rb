Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :tmp_steps
  resources :tmps
end
