Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/change_password'
  root to: redirect('/appointments/new')

  resources :appointments do
    collection do
      post :import
      get 'patient/:patient_id', action: :index, as: :patient_appointments
      get 'staff_member/:staff_member_id', action: :index, as: :staff_member_appointments
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }, sign_out_via: :delete



  # new namespace  to allow us to group endpoints together
  namespace :api do
    resources :appointments, only: [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
