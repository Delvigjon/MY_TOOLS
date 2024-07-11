Rails.application.routes.draw do
  get 'profiles/edit'
  get 'profiles/update'
  devise_for :users
  root to: "pages#home"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  resources :tools do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :index, :update, :destroy, :edit]
  # Route pour afficher uniquement les outils de l'utilisateur connecté
  get "my_tools", to: "tools#my_tools", as: :my_tools
  resource :profile, only: [:edit, :update]
end
