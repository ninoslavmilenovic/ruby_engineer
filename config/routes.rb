Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :contact
  resources :posts

  get 'sitemap.xml',  to: 'home#sitemap',  defaults: { format: :xml },   as: :sitemap
  get 'robots.txt',   to: 'home#robots',   defaults: { format: :text },  as: :robots

  root 'home#index'
end
