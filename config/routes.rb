Rails.application.routes.draw do

  
  get 'quizlist/index'
  get 'quizlist/favorite'
  delete 'quizlist/:id', to: 'quizlist#destroy'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/index'
  get 'home/title_list'
  get 'home/question'
  get 'home/list'
  post 'home/question'
  delete 'home/:id', to: 'home#destroy'
  
  get 'settings/password'
  post 'settings/password'
  
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  
  resources 'upload', only: :index do
    collection {post :import}
  end
  
  resources 'favorite', only: [:create,:destroy]
end
