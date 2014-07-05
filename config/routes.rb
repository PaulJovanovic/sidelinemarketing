Rails.application.routes.draw do
  namespace :admin do
    resources :events do
      collection do
        post :placements
      end
      resources :event_purchases do
        collection do
          post :placements
        end
      end
    end
    resources :event_purchase_options
    resources :organizations do
      collection do
        post :placements
      end
      resources :teams do
        collection do
          post :placements
        end
        resources :athletes
      end
    end
    resources :galleries do
      collection do
        post :placements
      end
    end
    resources :photos
    resources :orders
    resources :pages do
      resources :editables
    end
    resources :slideshows do
      resources :slides do
        collection do
          post :placements
        end
      end
    end
  end
  resources :events do
    resources :orders do
      collection do
        get :confirmation
      end
    end
  end
  resources :athletes
  resources :galleries
  get "/contact", to: "contacts#new"
  resource :contacts
  root to: "home#index"
end
