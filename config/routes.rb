# frozen_string_literal: true

Rails.application.routes.draw do
  get 'like/index'
  get 'like/show'
  get 'like/update'
  get 'like/destroy'
  get 'like/new'
  get 'like/edit'
  root to: 'home#index'
  resources :home
  resources :welcome
  resources :team
  resources :contact
  resources :gossip
  resources :profile
  resources :city
  resources :gossip do
    resources :comment
  end
  resources :session, only: %i[new create destroy]

  # ressources :like
  put '/gossip/:id/like', to: 'gossip#like', as: 'like'
end
