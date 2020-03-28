Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :admins
  resources :products, only: [:index, :new, :create, :edit, :update]
end
