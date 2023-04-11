Rails.application.routes.draw do
  get "ticket/show"
  devise_for :users
  root "home#index"
  get "routes/index"
  resources :buses do
    resources :tickets
  end

  resources :routes do
    collection do
      get "search"
    end
  end
end
