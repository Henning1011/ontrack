Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Add Routes:
  resources :playlists
  get '/playlists/add_one', to: 'playlists#add_one'

  resources :playlist_tracks, only: :destroy

  get '/auth/spotify/callback', to: 'users#spotify'

  resources :tracks

  post 'playlist_tracks/:playlist_id/:spotify_id', to: 'playlist_tracks#create', as: :playlist_tracks

  get '/search', to: 'tracks#search'
  get '/enhanced_search', to: 'tracks#enhanced_search'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
