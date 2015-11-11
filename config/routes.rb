Rails.application.routes.draw do




  devise_for :users
  resources :users, only: [:update]
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :posts
  resources :topics do
     resources :posts, except: [:index]
   end

  resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
  end
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
