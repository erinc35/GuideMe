Rails.application.routes.draw do

  resources :trips

  resource :sessions

  resources :guides do

    resources :reservations

    resources :charges

  end

  resources :travelers do

    resources :reservations

  end

  root 'static_pages#index'

  resources :conversations, param: :slug

  resources :messages

  resources :yelps

  resources :available_dates

  resources :unavailable_dates

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
