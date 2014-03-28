Nextlist::Application.routes.draw do
  

  get "home/index"
  resources :users
  resources :messages
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
  
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
 
  scope :api do
    get "/users(.:format)" => "users#index"
    get "/users/:id(.:format)" => "users#show"
    get "/posts(.:format)" => "posts#index"
    get "/posts/:id(.:format)" => "posts#show"
    get "/messages(.:format)" => "messages#index"
    get "/posts/:id(.:format)" => "messages#show"
  end
  
  root to: "home#index"
  get '/users/users_index(.:format)'
  match '/users_index',  to: 'users#users_index',            via: 'get'
  
  get '/posts/posts_index(.:format)'
  match '/posts_index',  to: 'posts#posts_index',            via: 'get'
  
  get '/home/posting_board(.:format)'
  match '/posting_board',  to: 'home#posting_board',            via: 'get'
  
  get '/home/user_board(.:format)'
  match '/user_board',  to: 'home#user_board',            via: 'get'
  
  #get '/users/profile(:id)'
  match '/profile/(:id)',  to: 'users#profile',
      :as => :profile, 
      :via => :get
  
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
