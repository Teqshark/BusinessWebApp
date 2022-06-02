Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { users: 'users',
    confirmations: 'devise/confirmations', sign_up_create: 'home'
  }
  
  resources :dashboard
  resources :home, only: [:index, :our_mission, :about]
  
  resources :user do 
    resources :project 
  end

root 'home#index'
get 'home/about'
# , to: 'home#about'
get 'home/our_mission'
get 'home/gallery'
  
devise_scope :user do
  get "/users/sign_out" => "devise/sessions#destroy"
end
  # get 'users/sign_out', to: 'devise/sessions#destroy'

  # post "/dashboard", to: "sign_up_create#update"



  get '/users', to: 'users#index'
  # devise_for :users, controllers: {sessions: 'devise/sessions', users: 'users'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  #  list of users ?
  # get 'users#sign_up'
  # get 'users#sign_in'
  # get '/'
  # get '/sign'
  # get 'devise/sessions#new'
  # get '/users/sign_up'

  # new devise registrations//missing controller?
  get 'devise/registrations/index'

  # get 'devise/registrations#new'
  # (.:format) 
  # get 'dashboard/index'
  # post 'dashboard/index'

  # get '/dashboard/new'
  # get 'dashboard/show'
  # get 'dashboard/edit'
  # post 'dashboard/create'
  # post 'dashboard/update',  to 'dashboard#update'


  get 'users/index'

  resources :sign_up_create
  
  post "/signupcreate", to: "sign_up_create#create"

  # resdaer
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'dashboard#index'
  


# get '/users/:user', to: 'devise/sessions#sign_in', as: 'user'

# get '/users/:user', to: 'devise/sessions#destroy'
# , as: 'user'

# resource :users
# unauthenticated do
  # root to: "home#index"
# end
# authenticated do 
  # root :to => 'dashboard#index'
# end

# as :user do
  # get 'sign_in', :to => 'devise/sessions#new'
  # get 'sign_out', :to => 'devise/sessions#destroy'
# end

#  get '/users/:username', to: 'sessions#show' 
#  get '/users/:username', to: 'sessions#show', as: 'user'
# controllers {sessionsController}
# get '/users/new' controllers { sessionsController}
end
