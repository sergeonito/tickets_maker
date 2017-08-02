# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tickets#new'

  resources :tickets
  devise_for :users
end
