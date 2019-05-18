Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/index'
  get 'home/title_list'
  get 'home/question'
  post 'home/question'
  
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  
  resources 'upload', only: :index do
    collection {post :import}
  end
  
  resources 'favorite', only: [:create,:destroy]
end
