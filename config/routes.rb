Rails.application.routes.draw do

  resources :charity_categories

  resources :admin, only: :index

  get 'faq' => 'static_pages#faq'
  get 'submissiontype' => 'static_pages#choose_submission_type'
  get 'petition_link' => 'static_pages#petition_link'
  get 'founders' => 'static_pages#about_the_founders'
  get 'terms' => 'static_pages#terms'
  get 'dashboard' => 'dashboard#show'
  get 'thanks' => 'donations#thanks'
  get 'donations' => 'donations#index'


  resources :demo_day_contacts, only: :create

  resources :submissions do
    member do
      get 'counter'
      get 'ball_rolling_payment'
    end
  end

  devise_for :users

  resources :donations, only: [:create, :destroy]
  resources :charities

  authenticated :user do
    root 'dashboard#show', as: :authenticated_root
  end

  get 'home', to: 'home#index'

  root 'home#index'
end
