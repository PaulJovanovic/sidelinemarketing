Rails.application.routes.draw do
  namespace :admin do
    resources :events do
      resources :event_purchases
    end
    resources :event_purchase_options
    resources :organizations do
      resources :teams do
        resources :athletes
      end
    end
    resources :galleries
    resources :photos
    resources :orders
    resources :pages do
      resources :editables
    end
    resources :slideshows do
      resources :slides
    end
  end
  resources :events do
    resources :orders
  end
  resources :athletes
  resources :galleries
  get "/contact", to: "contacts#new"
  resource :contacts
  root to: "home#index"
end
