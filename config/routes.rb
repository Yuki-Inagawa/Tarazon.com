Rails.application.routes.draw do

  devise_for :users
  root 'products#index'
  get   'users/:id'   =>  'users#show'
  resources :products do
    collection do
      get 'ranking'
    end
    resources :reviews,only: [:new, :create]
    collection do
      get 'search'
    end
  end

end
