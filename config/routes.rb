Rails.application.routes.draw do

  resources :admin, only: :index

  # resources :beta_users

  get 'faq' => 'static_pages#faq'
  get 'submissiontype' => 'static_pages#choose_submission_type'
  get 'petition_link' => 'static_pages#petition_link'
  # get 'charity_link' => 'static_pages#charity_link'
  get 'founders' => 'static_pages#about_the_founders'
  get 'terms' => 'static_pages#terms'
  get 'dashboard' => 'dashboard#show'
  get 'thanks' => 'donations#thanks'

  resources :demo_day_contacts, only: :create

  resources :submissions do
    member do
      get 'counter'
    end
  end

  devise_for :users
  # devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  resources :donations, only: [:create, :destroy]
  resources :charities
  # resources :causes

  root 'home#index'
end
