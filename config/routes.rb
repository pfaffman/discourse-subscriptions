# frozen_string_literal: true

DiscoursePatrons::Engine.routes.draw do
  # TODO: namespace this
  scope 'admin' do
    get '/' => 'admin#index'
  end

  namespace :admin do
    resources :plans
    resources :subscriptions, only: [:index]
  end

  resources :customers, only: [:create]
  resources :plans, only: [:index]
  resources :patrons, only: [:index, :create]

  get '/' => 'patrons#index'
  get '/:pid' => 'patrons#show'
end
