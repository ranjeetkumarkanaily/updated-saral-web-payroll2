UpdatedSaralWebPayroll::Application.routes.draw do

  resources :hr_masters, :except => [:index, :show]

  resources :hr_category_details

  resources :hr_categories, :except => [:edit]

  resources :financial_institutions, :except => [:edit]

  resources :pt_group_rates, :except => [:edit]

  resources :esi_group_rates

  resources :branches, :except => [:edit]

  resources :pf_group_rates

  resources :esi_groups, :except => [:edit]

  resources :pf_groups, :except => [:edit]

  resources :classifications

  resources :classification_headings, :except => [:edit]

  resources :holidays, :except => [:edit]

  resources :attendance_configurations, :except => [:edit]

  resources :pt_rates, :except => [:edit]

  resources :pt_groups, :except => [:edit]

  resources :pf_esi_rates, :only => [:new, :create, :update, :index]

  resources :paymonths, :only => [:new, :create, :update, :destroy, :index]

  resources :salary_totals


  resources :default_values

  resources :states, :except => [:edit]

  resources :employee_details

  resources :employees, :except => [:edit] do
    get "upload",  :on => :collection
    post "upload_parse_validate",  :on => :collection
    post "save", :on => :collection

    get "report",  :on => :collection

    get "pf_contribution_restrict", :on => :collection

    put "pf_restrict_update", :on => :collection

    get 'generate_sample_excel_template',  :on => :collection
  end



  resources :leave_details, :only => [:index] do
    get 'upload', :on => :collection
    post 'upload_parse_validate', :on => :collection
    post 'save', :on => :collection
    get 'generate_sample_excel_template',  :on => :collection
  end

  resources :companies, :except => [:show, :destroy]

  resources :salary_group_details

  resources :salary_heads, :except => [:edit]

  resources :salary_groups, :except => [:edit]

  resources :salary_allotments, :only => [:edit, :update, :index] do
    put :update, :on => :collection

    get 'upload', :on => :collection
    post 'upload_parse_validate', :on => :collection
    get 'generate_sample_excel_template',  :on => :collection
  end

  root :to => 'welcome#index'

  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'welcome' => 'welcome#index', :as => :welcome

  resources :lops, :only => [:index, :create] do
    post 'file_upload', :on => :collection
  end

  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  resources :salaries, :only => [:index, :create, :new] do
    get 'edit', :on => :collection
    put :update, :on => :collection

    get "salary_sheet",  :on => :collection
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
