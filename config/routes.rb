Rails.application.routes.draw do




  get 'comments/new'

  get 'comments/create'

  devise_for :users
  resources :users, only: [:update]
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :posts
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
