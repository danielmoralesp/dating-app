Rails.application.routes.draw do

  # Creates like/dislike route for matches to allow match to be created
  get 'matches/:id/set_like' => 'matches#set_like', as: :set_like_match
  get 'matches/:id/set_dislike' => 'matches#set_dislike', as: :set_dislike_match

  # Relationship paths for showing current match, sending messages, 
  get 'relationships/:id/' => 'relationships#show', as: :relationships
  post 'relationships/:id/create' => 'relationships#create_message', as: :reply
  get 'relationships/:id/set_status/:user_flag' => 'relationships#set_status', as: :set_status_relationship

  root 'home#index'

  devise_for :users, :controllers => { 
    :registrations =>  'registrations',
    # :sessions => 'sessions',
    # :passwords => 'passwords' 
    #:omniauth_callbacks => 'callbacks'
  }
    
    get "users/:id", :controller => "users", :action => "index", as: :user
    get "users/:id/settings", :controller => "users", :action => "edit", as: :edit_user
    patch "users/:id" => 'users#update', as: :update

    get "users/:id/profile", :controller => "profiles", :action => "show", as: :profile
    get "users/:id/profile/edit", :controller => "users", :action => "edit_profile", as: :edit_profile
    patch "users/:id/profile/edit" => 'users#update_profile'

    get '/matches' => 'matches#index'

    
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
