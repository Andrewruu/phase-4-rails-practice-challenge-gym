Rails.application.routes.draw do
  resources :gyms, only: [:show, :destroy]
  resources :clients, only: [:show]
  resources :memberships, only: [:create]
end
