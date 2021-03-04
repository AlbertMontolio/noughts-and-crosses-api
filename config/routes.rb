Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'sign-in-with-email', to: 'users#sign_in_with_email'

  resources :users, only: [] do
    resources :games, only: [:index]
  end

  resources :games, only: [:create]
end
