Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/change_password'
  # delete 'users/sign_out'
  root to: redirect('/appointments/new')

  # post 'appointments/new', to: 'appointments#new', as: :import

  resources :appointments do
    collection do
      post :import
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # new namespace  to allow us to group endpoints together
  namespace :api do
    resources :appointments, only: %i[index show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
