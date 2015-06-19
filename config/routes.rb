Rails.application.routes.draw do

  get 'images/create'

  get 'images/edit'

  get 'images/update'

  get 'images/destroy'

  root to: 'welcome#index'
  
  # Welcome controller routes
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'client_landing' => 'welcome#client_landing'
  
  # Devise/User controller routes
  #  add prefix to avoid conflicts with admin's user creation
  #  tell Devise to use the registrations_controller.rb for redirect after updates
  devise_for :users, :path_prefix => 'my', :controllers => { :registrations => :registrations }
  resources :users, only: [:index, :show, :update, :create, :destroy]
  delete 'delete_client' => 'users#destroy', as: :delete_client
  get 'change_password_cleanser' => 'users#change_password_cleanser', as: :change_password_cleanser
  
  # Wedding controller routes
  resources :weddings, only: [:show, :update, :create]
  get 'add_wedding/:id' => 'weddings#create', as: :add_wedding
  
  # Invitation controller routes
  get 'temporary_password_cleanser/:id' => 'invitations#destroy', as: :temporary_password_cleanser
  get 'confirmation' => 'invitations#confirmation'
  get 'send_invitation/:id' => 'invitations#create', as: :send_invitation
  
  # Invoices, Charges, Payments
  resources :invoices
  resources :items
  # resources :charges, only: [:create]
  post 'create_charge/:id' => 'charges#create', as: :create_charge
  get 'new_charge/:id' => 'charges#new', as: :new_charge

  # Images
  resources :collections, only: [:index, :create, :edit, :update, :destroy]
  resources :images, only: [:create, :destroy]

  
  
  
  
  
  
  
  

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
