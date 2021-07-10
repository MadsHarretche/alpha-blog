Rails.application.routes.draw do
root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'sources', to: 'sources#new'
  resources :users, except: [:new]
  resources :articles
  resources :sources
  resources :categories, except: [:destroy]
end
