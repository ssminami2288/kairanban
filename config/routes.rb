Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :posts do
    get :menu, on: :collection
  end

  resources :stamps, only: [:create]
  resources :meetings, only: [:create]
  resources :access, only: [:new, :create]
  
  # 標準的なCRUDアクションに対してルートを自動生成
  resources :news do
  end
  
  get '/board', to: 'posts#show', as: 'board'
  get 'menu', to: 'menu#index', as: 'menu'
  get '/menu.html', to: 'menu#index'

end