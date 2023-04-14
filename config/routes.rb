Rails.application.routes.draw do
  root "routes#index"
  get "my_tickets", to: "users#my_tickets"
  get "cancelled_tickets", to: "tickets#cancelled_tickets"
  devise_for :users
  resources :tickets
  resources :buses do
    resources :tickets do
      get "approve_ticket"
      get "reject_ticket"
      get "cancel_ticket"
    end
  end
  resources :routes do
    resources :buses
    collection do
      get "search"
    end
  end
end
