# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => "/api-docs"
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :recipes, only: %i[index show]
      resources :dogs, only: %i[index show create update destroy] do
        resources :recommended_recipes, only: %i[index]
        resources :allergies, only: %i[index create destroy], controller: "dog_allergies"
      end
      resources :reviews, only: %i[index show]
      resources :orders, only: %i[index show create update destroy]
      resources :sessions, only: %i[create destroy]
      resources :allergens, only: %i[index show]
      resources :medical_conditions, only: %i[index show]
    end
  end
end
