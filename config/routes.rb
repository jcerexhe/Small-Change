Rails.application.routes.draw do

  resources :beta_users

  get  'FAQ' => 'static_pages#faq'
  get 'submissiontype' => 'static_pages#choose_submission_type'
  get 'petition_link' => 'static_pages#petition_link'
  get 'charity_link' => 'static_pages#charity_link'
  get 'founders' => 'static_pages#about_the_founders'
  get 'termsandconditions' => 'static_pages#t_and_c'
  get 'contact' => 'static_pages#contact_us'
  get 'donatetosmallchange' => 'static_pages#sc_donation'
  get 'howitworks' => 'static_pages#how_it_works'
  get 'situation' => 'static_pages#situation_at_a_glance'
  get 'goal' => 'static_pages#our_goal'
  get 'users/goal' => 'static_pages#our_goal'
  get 'enquiries/goal' => 'static_pages#our_goal'
  get 'charitycontact' => 'static_pages#I_am_a_charity'
  get 'newscontact' => 'static_pages#I_am_a_news_organisation'

  get 'users/registrations/home' => 'home#index'

  get 'tree' => 'static_pages#charity_tree'
  get 'choose-charity' => 'static_pages#choose_charity'
  get 'mysmallchange' => 'static_pages#my_small_change'
  get 'aboutsmallchange' => 'static_pages#about_small_change'
  get 'thanks' => 'static_pages#thanks'

  resources :submissions do
    member do
      get 'counter'
    end
  end

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  resources :donations
  resources :submissions
  resources :charities
  resources :causes
  resources :enquiries
  resources :profiles

 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
