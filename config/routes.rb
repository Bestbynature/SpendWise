Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    resources :products
  end

  root "splash#index"
end
