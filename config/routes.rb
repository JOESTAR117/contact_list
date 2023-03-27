Rails.application.routes.draw do
  resources :contacts
  resources :static_pages, only: %i[index about contact]
  resources :users, only: %i[new create]

  get 'about', to: 'static_pages#about'
  get 'contato', to: 'static_pages#contato'

  root 'static_pages#index'
end
