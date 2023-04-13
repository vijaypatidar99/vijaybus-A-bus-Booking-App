Rails.application.routes.draw do
  get "tickets/user_tickets"
  get "tickets/show"
  get "tickets/:id", to: "tickets#index", as: "ticket"
  post "/tickets/send_index", to: "tickets#send_index", as: "send_index_tickets"
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
end
