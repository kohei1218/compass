Rails.application.routes.draw do
  # Auth Routes
  devise_for :admin, controllers: {
      sessions:      'admin/sessions',
      passwords:     'admin/passwords',
  }
  devise_for :users

  # User Routes
  root controller: :home, action: :index
  resources :recruits, only: [:index, :show]
  resource :profile, only: [:show, :edit, :update]


  # Admin Routes
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :recruits
    resources :companies
    resources :users, only: [:index, :show]
    resource :profile, only: [:show, :edit, :update]
  end
end
