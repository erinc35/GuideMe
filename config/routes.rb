Rails.application.routes.draw do


  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  get 'reviews/show'

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

  get 'mail_conversations/trash'
  post 'mail_conversations/trashing'
  post 'mail_conversations/removing'
  get 'mail_conversations/outbox'

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
