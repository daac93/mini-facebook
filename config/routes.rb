Rails.application.routes.draw do
  root 'pages#homepage'
  
  devise_for :users
  
  resources :posts, :only => [:create] do
    member do
      put 'like', to: 'posts#like'
    end
  end
  
  get 'profile', to: 'users#my_profile'
  get 'friends', to: 'users#friends'
  get 'people', to: 'users#index'
  get 'search_friends', to: 'users#search'
  get 'friends/requests', to: 'users#friend_requests'
  
  resources :users, :only => [:show]  do
    member do
      post 'request_friend', to: 'users#send_friend_request'
      post 'decline_friend', to: 'users#decline_friend_request'
      post 'accept_friend', to: 'users#accept_friend_request'
      post 'remove_friend', to: 'users#remove_friend'
    end
  end
  
  #post 'request_friend', to: 'users#send_friend_request'
  #post 'decline_friend', to: 'users#decline_friend_request'
  #post 'accept_friend', to: 'users#accept_request'
  #post 'remove_friend', to: 'users#remove_friend'
  
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
