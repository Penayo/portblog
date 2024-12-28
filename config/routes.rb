Rails.application.routes.draw do
  get "home/index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"

  resources :articles do
    resources :comments do
      get "reply" => :reply
    end
  end

  resources "authors"
  resources :accounts

  resources :sessions, only: [ :new, :create, :destroy ]
  get "login" => "sessions#new"

  get "automation-service" => "landing_pages#automation_service"
  post "automation-service-create_contact" => "landing_pages#create_contact"
end
