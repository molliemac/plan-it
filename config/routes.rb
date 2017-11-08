Rails.application.routes.draw do
  get 'yelp_searches/search'

  resources :home
  resources :yelp_searches

  resources :events do
    resources :event_users, path: :users, module: :events
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  devise_scope :user do	
	 authenticated :user do
	  root 'welcome#index', as: :authenticated_root
  	end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
end

  get "home/index"
  root 'home#index'

end
