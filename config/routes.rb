Rails.application.routes.draw do
  resources :galleries, only: :show

  devise_for :users, path: 'admin'

  namespace :admin do
    resources :galleries, except: :show
    root to: 'galleries#index'
  end

  root to: 'admin/galleries#index'
end
