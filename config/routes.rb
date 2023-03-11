Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # resources :users do
  #   member do
  #     get :account
  #     get :profile
  #   end
  # end

  resources :users do
    collection do
      get :account
      get :profile
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    # collection do
    #   get :search
    # end
end

  root to: 'home#top'
end
