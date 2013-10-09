HopeHawaiiData::Application.routes.draw do

  # get "er_visits/index"
  # get "er_visits/show"
  # get "er_visits/new"
  # get "er_visits/edit"
  # get "hospital_visits/new"
  # get "hospital_visits/edit"
  # get "hospital_visits/show"
  # get "hospital_visits/index"
  # get "interventions/new"
  # get "interventions/index"
  # get "interventions/show"
  # get "interventions/edit"
  # get "participants/new"
  # get "participants/index"
  # get "participants/show"
  # get "participants/edit"
  
  devise_for :users
  root :to => "participants#index"

  resources :participants do
    resources :interventions
  end

  resources :interventions do
    resources :hospital_visits
    resources :er_visits
  end

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
