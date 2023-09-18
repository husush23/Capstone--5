Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  # resources :users do
  #   resources :categories do
  #     resources :exchanges
  #   end
  # end

  resources :categories, only: [:index, :new, :create]
  root "categories#index"
end
