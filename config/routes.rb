Rails.application.routes.draw do
  get 'urls/index'
  post 'urls/add_click_count'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "urls#index"
  resources :urls
end
