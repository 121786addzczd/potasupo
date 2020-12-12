Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'homes#index'
  resources :reviews

  resources :users, only: [:show, :edit, :update]

  resources :informations

  resource :contacts, only: [:new, :create] do
    get "/thanks" => "contacts#thanks"
  end
end
