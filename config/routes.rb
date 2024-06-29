# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  defaults format: :json do
    resources :daimyos, only: %i[index show]
    resources :samples, only: %i[index] do
      member do
        get '/', action: :new
        post '/', action: :create
      end
    end
  end
end
