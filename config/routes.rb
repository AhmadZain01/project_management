Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :managers
  namespace :managers do
    resources :employees 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
