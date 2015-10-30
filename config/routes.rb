Rails.application.routes.draw do




  devise_for :users
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :posts
  resources :topics do
     resources :posts, except: [:index] do
      resources :summary, only: [:new, :create, :show]
    end
   end
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
