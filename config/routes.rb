Rails.application.routes.draw do
  resources :donations, only: [:create]

  root to: 'donations#new'
end
