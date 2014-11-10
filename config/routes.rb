Rails.application.routes.draw do
  resources :contact

  root 'home#index'
end
