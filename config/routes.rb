Rails.application.routes.draw do
  root 'pages#home'
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  get '/trips' => 'reservations#trips'
  devise_for :users,
             controllers: {registrations: 'registrations'},
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 edit: 'profile'
             }
  resources :users, only: [:show]
  resources :rooms do
    resources :reservations, only: [:create]
  end
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
