Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Route pour afficher uniquement les outils de l'utilisateur connecté
  get "my_tools", to: "tools#my_tools", as: :my_tools

  # Route pour la santé de l'application
  get "up", to: "rails/health#show", as: :rails_health_check

  # Routes pour les ressources existantes
  resources :bookings
  resources :tools
end
