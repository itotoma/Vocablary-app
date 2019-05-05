Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/index'
  get 'home/title_list'
  get 'home/question'
  
  
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  #root to: 'snsusers#new'
  #get '/users/auth/facebook/callback', to: 'home#index'
  #OAuthのコールバック用のルーティング omniauth_cllbackとは?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  # rails規約 コントローラ#アクション
end
