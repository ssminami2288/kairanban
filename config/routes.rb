Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :posts do
    member do
      delete 'delete_pdf'
    end
  end
  get :menu, to: 'posts#menu', on: :collection
  
  resources :stamps, only: [:create]
  resources :meetings, only: [:create]
  resources :access, only: [:new, :create]
  
  # 標準的なCRUDアクションに対してルートを自動生成
  resources :news
  
  get '/board', to: 'posts#show', as: 'board'
  get 'menu', to: 'menu#index', as: 'menu'
  get '/menu.html', to: 'menu#index'

end