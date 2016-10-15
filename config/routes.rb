Rails.application.routes.draw do

  resource :sessions

  resources :guides

  resources :travelers

  root 'static_pages#index'

  resources :conversations, param: :slug

  resources :messages

  resources :yelps

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
