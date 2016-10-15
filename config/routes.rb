Rails.application.routes.draw do

  get 'unavailable_dates/show'

  get 'unavailable_dates/new'

  get 'unavailable_dates/create'

  get 'unavailable_dates/update'

  get 'unavailable_dates/destroy'

  get 'available_dates/show'

  get 'available_dates/new'

  get 'available_dates/create'

  get 'available_dates/update'

  get 'available_dates/destroy'

  resource :sessions

  resources :guides

  resources :travelers

  root 'static_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
