Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :admins
  resources :products, except: :show
end
