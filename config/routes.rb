# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  root 'documents#index'

  namespace :api do
    resources :documents, only: %i[index show create]
  end

  resources :documents, only: %i[index show new]
end
