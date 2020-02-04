Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users, only: [:show] do
    resources :user_tickets, only: [:new, :create]
  end
end
