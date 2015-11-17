Rails.application.routes.draw do
  get('/api/pirate_form', { :controller => "api", :action => "pirate_form"})
  get('/api/pirate_process', { :controller => "api", :action => "pirate_process"})
  get('/api/coord_form', { :controller => "api", :action => "coord_form"})
  get('/api/coord_process', { :controller => "api", :action => "coord_process"})
  get('/api/nearest', { :controller => "api", :action => "nearest_station"})

  get('/auth_api/mashape_intro_form', { :controller => "auth_api", :action => "mashape_intro_form"})
  get('/auth_api/mashape_intro_process', { :controller => "auth_api", :action => "mashape_intro_process"})
  get('/auth_api/face_detection_form', { :controller => "auth_api", :action => "face_detection_form"})
  post('/auth_api/face_detection', { :controller => "auth_api", :action => "face_detection"})
  get('/auth_api/sentiment_analysis_form', { :controller => "auth_api", :action => "sentiment_analysis_form"})
  post('/auth_api/sentiment_analysis', { :controller => "auth_api", :action => "sentiment_analysis"})
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
