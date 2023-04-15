Rails.application.routes.draw do
 get  "buses/search"
 get 'favicon.ico', to: redirect('/assets/favicon.ico')
  get "tickets/all_bookings"
  root "routes#index"
  get "my_tickets", to: "users#my_tickets"
  get "cancelled_tickets", to: "tickets#cancelled_tickets"
  post "cancel_bus_ticket/:ticket_id", to: "tickets#cancel_ticket", as: "cancel_bus_ticket"
  devise_for :users
  resources :tickets
  resources :buses do
    resources :tickets do
      get "approve_ticket"
      get "reject_ticket"
      get "cancel_ticket"
      get "tickets/send_email"
    end
  end
  resources :routes do
    resources :buses
  end
end
