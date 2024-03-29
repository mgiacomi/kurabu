Rails.application.routes.draw do

  match '/signups/new'         => 'signups#new',     :as => :signups_new,     :via => :get
  match '/signups'             => 'signups#create',  :as => :signups,         :via => :post
  match '/signups/pay/:id'     => 'signups#pay',     :as => :signups_pay,     :via => :get
  match '/signups/receipt/:id' => 'signups#receipt', :as => :signups_receipt, :via => :get
  match '/signups/paypal'      => 'signups#paypal',  :as => :signups_paypal,  :via => :post
  match '/signups/denied'      => 'signups#denied',  :as => :signups_denied,  :via => :get
  match '/privacy'             => 'signups#privacy', :as => :privacy,         :via => :get
  match '/support'             => 'signups#support', :as => :support,         :via => :get

  devise_for :users, skip: :registrations

# Admin Resources
  namespace :kmgr do
    resources :forms
  end

  match '/kmgr'                         => 'kmgr/overviews#index',      :as => :kmgr_overview,            :via => :get
  match '/kmgr/search'                  => 'kmgr/overviews#search',     :as => :kmgr_search,              :via => [:post,:put]
  match '/kmgr/details/:grade/:session' => 'kmgr/overviews#details',    :as => :kmgr_overview_details,    :via => :get
  match '/kmgr/reports'                 => 'kmgr/reports#index',        :as => :kmgr_reports_index,       :via => :get
  match '/kmgr/reports/show/:id'        => 'kmgr/reports#show',         :as => :kmgr_reports_show,        :via => :get
  match '/kmgr/reports/signuplist/:id'  => 'kmgr/reports#signuplist',   :as => :kmgr_reports_signuplist,  :via => :get
  match '/kmgr/reports/signuplist'      => 'kmgr/reports#list',         :as => :kmgr_reports_list,        :via => :get
  match '/kmgr/reports/emaillist/:id'   => 'kmgr/reports#emaillist',    :as => :kmgr_reports_emaillist,   :via => :get
  match '/kmgr/reports/dump'            => 'kmgr/reports#dump_report',  :as => :kmgr_reports_dump_report, :via => :get
  match '/kmgr/payment/update'          => 'kmgr/forms#payment_update', :as => :kmgr_payment_update,      :via => [:post, :patch]
  match '/kmgr/application/delete/:id'  => 'kmgr/forms#delete',         :as => :kmgr_application_delete,  :via => [:post, :patch]

  match '/kmgr/reports/signupsheet/:grade/:session' => 'kmgr/reports#signupsheet',  :as => :kmgr_reports_signupsheet, :via => :get

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
