Rails.application.routes.draw do
  get 'guides/new'

  get 'guides/create'

  get 'guides/show'

  get 'guides/edit'

  get 'guides/update'

  get 'guides/destroy'

  resources :travelers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
