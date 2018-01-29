Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: "physicians#index"

  resources :physicians do
    resources :physician_reviews
  end

  resources :users, only: [:index]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
