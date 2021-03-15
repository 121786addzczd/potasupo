Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :spots do
    resources :reviews, only: [:index, :create]
  end
  resources :tweets
  resources :users, only: [:show, :edit, :update]
  resources :informations
  resources :contacts, only: [:index, :new, :create] do
    get "/thanks" => "contacts#thanks"
  end
end
