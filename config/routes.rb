Rails.application.routes.draw do
  resource :sessions

  resources :guides

  resources :travelers

  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
