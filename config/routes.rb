Rails.application.routes.draw do
  get 'users/show'

  devise_for :users,
             controllers: {registrations: 'registrations'},
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 edit: 'profile'
             }
  root 'pages#home'
  resources :users, only: [:show]
  resources :rooms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
