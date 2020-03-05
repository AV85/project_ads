# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :categories
  resources :ads

  namespace :cabinet do
    resources :users
  end

end
