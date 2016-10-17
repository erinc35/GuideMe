Rails.application.routes.draw do

  get 'trips/index'

  get 'trips/new'

  get 'trips/create'

  get 'trips/show'

  get 'trips/edit'

  get 'trips/update'

  get 'trips/destroy'

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

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
