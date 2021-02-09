Rails.application.routes.draw do
  get 'urls/index'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "urls#index"
  resources :urls do
    member do
      post :add_click_count
    end
  end
end
