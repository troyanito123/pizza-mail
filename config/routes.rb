Rails.application.routes.draw do
  root 'pizzas#new'

  resources :users, only: [:new, :create]

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#delete'

  resources :pizzas, only: [:new, :index, :create]
  get :preview, to: 'pizzas#preview'
  post :add_ingredient, to: 'pizzas#add_ingredient', as: :add
  post :remove_ingredient, to: 'pizzas#remove_ingredient', as: :remove
  post :change_size, to: 'pizzas#change_size', as: :change

  resources :reports, except: [:show]
  post 'on/:id', to: 'reports#report_on', as: 'on'
  delete 'off/:id', to: 'reports#report_off', as: 'off'
  post :custom, to: 'reports#custom_prevalence'

  get '*path', to: 'pizzas#new'
end
