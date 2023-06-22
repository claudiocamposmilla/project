Rails.application.routes.draw do
  devise_for :users
  resources :user_resolutions
  resources :resolutions
  resources :user_comments
  resources :user_tickets
  resources :tickets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  #root "static_pages#admin_index"
  root "static_pages#home"

  resources :executive_users, controller: 'users', type: 'executive' do
    resources :user_tickets
  end

  resources :users do
    member do
      get 'my_comments'
    end
  end

  resources :users do
    member do
      get 'my_replies'
    end
  end

  resources :users do
    member do
      get 'my_resolutions'
    end
  end

  resources :users do
    get 'my_resolutions', on: :member
  end


end
