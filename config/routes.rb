Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :post_images
  resources :users, only:[:show, :edit, :update]
  resources :events
  get 'my_calendar', to: 'events#my_calendar'
end
