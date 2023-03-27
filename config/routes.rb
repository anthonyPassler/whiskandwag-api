Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :recipes, only: %i[index show]
      resources :dogs, only: %i[index show]
      resources :reviews, only: %i[index show]
      resources :orders, only: %i[index show]
      resources :sessions, only: %i[create destroy]
    end
  end
end
