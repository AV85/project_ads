# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users

  root 'home#index'
  resources :categories, only: [:index, :show]
  resources :ads, only: [:index, :show]

  namespace :cabinet do
    resources :users
    resources :categories
    resources :ads
    get '/ads/:id/drop_img', to: 'ads#destroy_img'
    get '/ads/:id/send_to_moderator', to: 'ads#send_to_moderator', as: 'to_mod'
    get '/ads/:id/to_ban', to: 'ads#to_ban', as: 'to_ban'
    get '/ads/:id/to_approve', to: 'ads#to_approve', as: 'to_approve'
    get '/ads/:id/to_publish', to: 'ads#to_publish', as: 'to_publish'
    get '/ads/:id/to_archive', to: 'ads#to_archive', as: 'to_archive'
  end

end
