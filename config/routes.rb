Rails.application.routes.draw do

 
 get '/' => 'static_pages#index'
 
 
  namespace :member do
    root 'top#index'
    get 'login' => 'sessions#new', as: :login
    get 'signup' => 'signups#new'
    get 'vegetable' => 'top#vege'
    get 'prod' => 'top#prod'
    get 'sweets' => 'top#sweets'
    get 'goods' => 'top#goods'
    get 'store' => 'top#store'
    get 'art' => 'top#art'
    get 'play' => 'top#play'
    get 'event' => 'top#event'
    get 'care' => 'top#care'
    get 'move' => 'top#move'
    get 'group' => 'top#group'
    get 'ship' => 'top#ship'
    get 'give' => 'top#give'
    get 'etc' => 'top#etc'
    resource :session, only: [:create, :destroy]
    resource :account, except: [:new, :create, :destroy]
    resource :signup, only: [ :create, :destroy ]
    resources :posts 
    get 'select' => 'posts#select'
    resource :password, only: [ :show, :edit, :update ]
    resources :shops 
    resources :members do
        member do 
    get 'shop' => 'members#shop'
end
end
    resources :info, only: [ :index,:show ] do
        member do
            get 'howto' => 'info#howto'
            get 'why' => 'info#why'
            get 'vision' => 'info#vision'
            end
        end
    resource :comments, only: [ :edit, :create, :destroy ]
  end

  
  namespace :visitor do
    root 'top#index'
  end

 
  namespace :admin do
    root 'top#index'
    get 'signup' => 'signups#new'
    get 'login' => 'sessions#new', as: :login
    resource :session, only: [:create, :destroy]
    resource :signup, only: [ :create, :destroy ]
    resources :info
    resources :members do
    resources :shops
    resource :member_password, only: [ :show, :edit, :update ]
end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
