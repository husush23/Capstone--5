Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users

  authenticated :user do
    resources :categories do
      resources :exchanges
    end
  end

  root "categories#index"
end
