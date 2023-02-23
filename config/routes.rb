Rails.application.routes.draw do
  root 'pages#home'
  get 'apply', to: 'pages#apply'
  get 'start', to: 'pages#start', as: 'start'
  get 'thanks', to: 'pages#thanks', as: 'thanks'
  get 'magic_link', to: 'pages#magic_link', as: 'magic_link'

  devise_for :users
  get 'logout', to: 'pages#logout', as: 'logout'

  get 'dashboard', to: 'dashboard#index'
  get 'stakeholder_updates/new', to: 'stakeholder_updates#new'

  resources :user_submissions, only: [:create]

  resources :subscribe, only: [:index]
  # resources :dashboard, only: [:index]
  resources :account, only: [:index, :update]
  resources :billing_portal, only: [:create]
  match '/billing_portal' => 'billing_portal#create', via: [:get]
  match '/cancel' => 'billing_portal#destroy', via: [:get]

  # static pages
  pages = %w(
    privacy terms
  )

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: "#{page.gsub('-', '_')}"
  end

  # admin panels

  namespace :admin do
    get '/', to: 'pages#dashboard'
    resources :user_submissions, only: [:update]
  end
  # authenticated :user, -> user { user.admin? } do
  #   namespace :admin do
  #     resources :dashboard, only: [:index]
  #     resources :impersonations, only: [:new]
  #     resources :users, only: [:edit, :update, :destroy]
  #   end
  #
  #   # convenience helper
  #   get 'admin', to: 'admin/dashboard#index'
  # end
end
