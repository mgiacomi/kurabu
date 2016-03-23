Rails.application.routes.draw do

  match '/signups/new'     => 'signups#new',    :as => :signups_new, :via => :get
  match '/signups'         => 'signups#create', :as => :signups,     :via => :post
  match '/signups/pay/:id' => 'signups#pay',    :as => :signups_pay, :via => :get

  devise_for :users, skip: :registrations
#  devise_for :users

# Admin Resources
  namespace :kmgr do
    resources :forms
  end

  match '/kmgr/payment/update' => 'kmgr/forms#payment_update', :as => :kmgr_payment_update, :via => [:post, :patch]
  match '/kmgr/application/delete/:id' => 'kmgr/forms#delete', :as => :kmgr_application_delete, :via => [:post, :patch]

  root 'signups#new'

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
