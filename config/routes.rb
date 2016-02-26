Rails.application.routes.draw do

  # resources :beta_users

  get 'faq' => 'static_pages#faq'
  get 'submissiontype' => 'static_pages#choose_submission_type'
  get 'petition_link' => 'static_pages#petition_link'
  # get 'charity_link' => 'static_pages#charity_link'
  get 'founders' => 'static_pages#about_the_founders'
  get 'terms' => 'static_pages#terms'
  get 'contact' => 'static_pages#contact'
  get 'aboutsmallchange' => 'static_pages#about_small_change'

  # get 'dashboard' => 'dashboard#show'

  resources :submissions do
    member do
      get 'counter'
    end
  end

  devise_for :users
  # devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  resources :donations
  # resources :charities
  # resources :causes
  # resources :enquiries
  # resources :profiles
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

end
