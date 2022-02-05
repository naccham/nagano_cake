Rails.application.routes.draw do

  devise_for :admin, controllers: { sessions: 'admin/sessions', registrations: 'admin/registrations' }
  devise_for :customers, controllers: { sessions: 'public/sessions', registrations: 'public/registrations' }
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new,:index, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    resources :items, only: [:index, :show]
    get '/customers/comfirm' => 'customers#confirm'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    resources :customers, only: [:show, :edit, :update]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post '/confirm' => 'orders#confirm'
    resources :orders, only: [:new, :create, :index, :show]
    get '/complete' => 'orders#complete'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
end
