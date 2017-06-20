Rails.application.routes.draw do
  devise_for :users  
  
  resources :tickets

  resource :search, only: [:new, :show]

  namespace :admin do

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_travel_time, on: :member
    end

    resources :trains do
      resources :cars, shallow: true
    end

    resources :routes
    resources :tickets

  end

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
