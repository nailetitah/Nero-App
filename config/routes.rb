Rails.application.routes.draw do
  get 'homepage/index'
  devise_for :users
  root 'homepage#index'
  resources :trainings, controller: 'trainings'
  # resources :users, only: [:show]
  resources :programme, only: [:index] 
  scope 'admin', module: 'admin' do
    resources :users, except: [:show]
    # resources :trainings
  end
end
