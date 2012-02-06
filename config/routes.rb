UpdatedSaralWebPayroll::Application.routes.draw do


  resources :branches

  resources :pf_group_rates

  resources :esi_groups

  resources :pf_groups

  resources :classifications

  resources :classification_headings

  resources :holidays

  resources :attendance_configurations

  resources :pt_rates

  resources :pt_groups

  resources :grades

  resources :departments

  resources :designations

  resources :pf_esi_rates

  resources :paymonths

  resources :salary_totals


  resources :default_values

  resources :states

  resources :employee_details

  resources :employees do
    get "upload",  :on => :collection
    post "upload_parse_validate",  :on => :collection
    post "save", :on => :collection

    get "report",  :on => :collection
  end

  resources :leave_details, :only => [:index] do
    get 'upload', :on => :collection
    post 'upload_parse_validate', :on => :collection
    post 'save', :on => :collection
  end

  resources :companies

  resources :salary_group_details

  resources :salary_heads

  resources :salary_groups

  resources :salary_allotments do
    put :update, :on => :collection
  end

  root :to => 'welcome#index'

  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'welcome' => 'welcome#index', :as => :welcome

  resources :lops, :only => [:index, :create] do
    post 'file_upload', :on => :collection
  end

  resources :sessions
  resources :users
  resources :salaries, :only => [:index, :create, :new] do
    get 'edit', :on => :collection
    put :update, :on => :collection
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
