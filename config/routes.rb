Rails.application.routes.draw do

  get 'members/show'
  get 'members/edit'
  # 顧客側のルーティング
  root to: 'homes#top'
  get '/about' => 'homes#about'
  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }
  resource :members, only: [:show,  :edit, :update]
  get  '/members/confirmation' => 'members#confirmation'
  post '/members/withdraw' => 'members#withdraw'
  resources :products ,only: [:index, :show]
  resources :cart_items,only: [:index, :create, :destroy, :update]
  delete '/cart_items/' => 'cart_items#reset'
  resources :shipping_addresses ,only: [:index, :new, :create, :edit, :update, :destroy]
  resources :orders,only: [:index, :new, :create, :show,]
  get '/orders/confirmation' => 'orders#confirmation'
  get '/orders/thank' => 'orders#thank'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
