Rails.application.routes.draw do
  resources :galleries, only: :show

  namespace :admin do
    resources :galleries, except: :show
    root to: 'galleries#index'
  end

  root to: 'admin/galleries#index'
end
