Rails.application.routes.draw do
  resources :appointments
  resources :doctors
  resources :bank_accounts
  resources :banks
  resources :addresses
  resources :pets
  resources :users

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
