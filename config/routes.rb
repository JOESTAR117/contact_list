Rails.application.routes.draw do
  resources :contacts
  resources :static_pages, only: %i[index about contact]

  get 'about', to: 'static_pages#about'
  get 'contato', to: 'static_pages#contato'

  root 'static_pages#index'
end
