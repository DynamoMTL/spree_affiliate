Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :affiliate_settings
    resources :affiliates
  end

  resources :affiliates, :only => [:show, :index]
end
