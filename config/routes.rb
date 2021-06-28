require 'sidekiq/web'

Rails.application.routes.draw do
  resources :trades
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => '/sidekiq'

  namespace :madmin do
    resources :users
    resources :services
    resources :notifications
    resources :announcements
    namespace :active_storage do
      resources :blobs
    end
    namespace :active_storage do
      resources :attachments
    end
    root to: "dashboard#show"
  end
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'trades#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
