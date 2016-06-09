Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
  # Routes for the Ccdebt resource:
  # CREATE
  #get "/", :controller => "ccdebts", :action => "index"
  root "ccdebts#index"

  get "/ccdebts/new", :controller => "ccdebts", :action => "new"
  post "/create_ccdebt", :controller => "ccdebts", :action => "create"

  # READ
  get "/ccdebts", :controller => "ccdebts", :action => "index"
  get "/ccdebts/:id", :controller => "ccdebts", :action => "show"

  # UPDATE
  get "/ccdebts/:id/edit", :controller => "ccdebts", :action => "edit"
  post "/update_ccdebt/:id", :controller => "ccdebts", :action => "update"

  # DELETE
  get "/delete_ccdebt/:id", :controller => "ccdebts", :action => "destroy"
  #------------------------------

  # Routes for the Ftdebt resource:
  # CREATE
  get "/ftdebts/new", :controller => "ftdebts", :action => "new"
  post "/create_ftdebt", :controller => "ftdebts", :action => "create"

  # READ
  get "/ftdebts", :controller => "ftdebts", :action => "index"
  get "/ftdebts/:id", :controller => "ftdebts", :action => "show"

  # UPDATE
  get "/ftdebts/:id/edit", :controller => "ftdebts", :action => "edit"
  post "/update_ftdebt/:id", :controller => "ftdebts", :action => "update"

  # DELETE
  get "/delete_ftdebt/:id", :controller => "ftdebts", :action => "destroy"
  #------------------------------

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
