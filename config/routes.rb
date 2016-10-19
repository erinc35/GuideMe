Rails.application.routes.draw do

  resources :trips
  
  resource :sessions

  resources :guides do

    post 'add_guide'

    post 'remove_guide'

    resources :reservations

  end

  resources :travelers do

    get 'checkout'

    resources :charges

    resources :reservations

  end

  resources :mail_conversations do
    resources :mail_messages
  end

  root 'static_pages#index'

  resources :conversations do
     resources :messages
   end

  get 'static_pages/about_us',  as: 'about_us'

  post '/yelps/remove'

  post '/yelps/add'

  resources :yelps

  resources :available_dates

  resources :unavailable_dates


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
