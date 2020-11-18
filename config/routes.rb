Rails.application.routes.draw do
  resources :projects
  resources :tasks do
    member do
      patch :move
    end
  end

  root to: 'projects#index'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
