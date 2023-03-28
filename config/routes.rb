Rails.application.routes.draw do
  resources :contacts
  resources :static_pages, only: %i[index about contact]
  resources :users, only: %i[new create show]

  get 'about', to: 'static_pages#about'
  get 'contato', to: 'static_pages#contato'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  root 'static_pages#index'
end
