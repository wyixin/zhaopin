Rails.application.routes.draw do
  resources :companies do
    collection do
      post 'create_job'
      get 'edit_job'
    end
  end
  resources :resumes, only: [:create_work, :display, :modify, :create_education, :index] do
    collection do
      post 'create_work'
      get 'display'
      post 'modify'
      post 'create_education'
      post 'create_intention_job'
      post 'create_train'

      post 'get_sub_industry'
      post 'get_sub_position'
      post 'get_area'
    end
  end
  resources :jobs do
    collection do
      get 'new_job'
    end
  end
  resources :articles do
    collection do
      get 'list'
    end
  end

  resources :categories
  resources :users, only: [:index, :new] do
    collection do
      post 'create_user'
    end
  end
  
  devise_for :users, controllers: {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
  }

  match '/uploads'=>'uploads#index', via: :post
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  match '/about'=>'welcome#about_us', via: :get

  root 'welcome#index'

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
