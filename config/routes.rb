Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'routes/index'
  resources :buses
  resources :routes do
    collection do
      get 'search'
    end
 
  end
end
