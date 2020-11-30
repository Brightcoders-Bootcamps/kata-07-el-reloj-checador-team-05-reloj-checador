# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'
  resources :reports
  resources :stores
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
