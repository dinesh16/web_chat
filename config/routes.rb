# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  # devise_scope :user do
  #   # Redirests signing out users back to sign-in
  #   get 'users', to: 'devise/sessions#new'
  # end

  resources :channels do
    post :join
    resources :messages, only: %i[new create]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
