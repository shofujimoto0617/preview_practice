Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :post_images do
  	resources :post_comments, only: [:create, :destroy]
  	resource :likes, only: [:create, :destroy]
  end
  resources :users, only:[:show, :edit, :index, :update] do
  	member do
  	  get :following, :followers
  	end
  end
  resources :events
  get 'my_calendar', to: 'events#my_calendar'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
