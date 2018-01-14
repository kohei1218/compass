Rails.application.routes.draw do
  # Auth Routes
  devise_for :admin, controllers: {
      sessions:      'admin/sessions',
      passwords:     'admin/passwords',
  }

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # static_pages
  get '/privacy', to: 'static_pages#privacy'
  get '/sitemaps', to: 'static_pages#sitemaps'
  get '/contacts', to: 'static_pages#contacts'

  # User Routes
  root controller: :home, action: :index
  resources :recruits, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy]
  end
  resource :profile, only: [:show, :edit, :update] do
    collection do
      get :show_resume
      get :edit_profile_resume
      get :edit_handicapped_resume
      get :edit_skill_resume
      get :edit_require_resume
      patch :update_profile_resume
      patch :update_handicapped_resume
      patch :update_skill_resume
      patch :update_require_resume
    end
  end
  resources :favorites, only: [:index, :show]
  resources :voices, only: [:index]
  resources :questions, only: [:index]
  resources :job_applications, only: [:index, :show, :create]

  # Admin Routes
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :recruits
    resources :companies
    resources :users, only: [:index, :show]
    resources :job_applications, only: [:index, :show]
    resource :profile, only: [:show, :edit, :update]
  end
end
