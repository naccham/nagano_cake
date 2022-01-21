Rails.application.routes.draw do

  devise_for :admin, controllers: { sessions: 'admin/sessions', registrations: 'admin/registrations' }
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new,:index, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  
  devise_for :customers, controllers: { sessions: 'public/sessions', registrations: 'public/registrations' }
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  scope module: :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get '/customers/comfirm' => 'customers#comfirm'
    get '/customers/withdrawal' => 'customers#withdrawal'
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :create, :index, :show]
    get '/complete' => 'orders#complete'
    get '/comfirm' => 'orders#comfirm'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
end
