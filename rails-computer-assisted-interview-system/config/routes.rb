Rails.application.routes.draw do
  get 'navigation/new'

  get 'navigation/create'

  devise_for :users, controllers: {registrations: "registrations"}
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
  #   namespace :admin do  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  root  "home#index"
  get "navigation" => "navigation#index"
  get "qnaires" => "qnaires#index"
  get "qnaires_start" => "qnaires#show"
  get "create_account" => "users#new"
  post "update_account" => "users#edit"
  post "update_project" => "projects#edit"
  get "create_project" => "projects#new"
  post "create_project" => "projects#create"
  get "show_projects" =>"projects#index"
  get "show_users"  =>"projects#show"
  get "assign_users" =>"users#assign"
  get "disassign_users" =>"users#disassign"

  resources :users
  resources :projects
  resources :qnaires, only:[:show, :index, :update, :new, :create]
  resources :qformats
end
