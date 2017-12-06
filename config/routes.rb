Rails.application.routes.draw do

  get 'home/index'

  resources :home
  get 'locations/:id/saved_search_add' => 'locations#saved_search_add', :as => :saved_search_add


  get '/foursquare', to: 'locations#foursquare'
  post '/foursquare', to: 'locations#foursquare'
  

  resources :events do
    resources :event_users, path: :users, module: :events
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :invitations => 'users/invitations', registrations: "registrations" }



  get "welcome/index"
  root 'home#index'

end
