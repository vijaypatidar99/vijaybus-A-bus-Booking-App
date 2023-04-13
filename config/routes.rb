Rails.application.routes.draw do
  root "home#index"
  get "users/show"
  devise_for :users
  resources :tickets
  get "/tickets/:id/approve", to: "tickets#approve_ticket", as: "approve_ticket"
  get "/tickets/:id/reject", to: "tickets#reject_ticket", as: "reject_ticket"

  resources :buses do
    resources :tickets
  end
  resources :routes do
    collection do
      get "search"
    end
  end
end
