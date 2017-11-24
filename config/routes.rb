Rails.application.routes.draw do
  # Auth Routes
  devise_for :admin, controllers: {
      sessions:      'admin/sessions',
      passwords:     'admin/passwords',
  }

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  # User Routes
  root controller: :home, action: :index
  resources :recruits, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy, :index, :show]
  end
  resource :profile, only: [:show, :edit, :update]
  resources :voices, only: [:index]
  resources :questions, only: [:index]

  # Admin Routes
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :recruits
    resources :companies
    resources :users, only: [:index, :show]
    resource :profile, only: [:show, :edit, :update]
  end
end
