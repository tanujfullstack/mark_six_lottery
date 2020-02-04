Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resource :users, only: [:show] do
    resource :user_tickets, only: [:new, :create]
  end
end
