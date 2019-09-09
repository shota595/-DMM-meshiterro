Rails.application.routes.draw do
  root 'post_images#index'
  devise_for :users
  delete "post_images/:id" => "post_images#destroy"
  resources :post_images, only: [:new, :create, :index, :show] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
