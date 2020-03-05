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
  end

end
