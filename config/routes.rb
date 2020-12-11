Rails.application.routes.draw do
  resources :standings
  resources :plays_fors
  resources :participates_ins
  resources :team_games
  resources :games
  resources :seasons
  resources :leagues
  resources :teams
  resources :players

  post '/login', to: 'authentication#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
