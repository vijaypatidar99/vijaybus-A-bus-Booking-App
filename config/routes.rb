Rails.application.routes.draw do
  get "tickets/user_tickets"
  get "tickets/show"
  get "tickets/print"
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
  get 'tickets/column/:name', to: 'tickets#print_column'

end
