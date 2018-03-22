Rails.application.routes.draw do

 get "registered_applications/index"
 get "registered_applications/show"
 get "registered_applications/new"
 get "registered_applications/edit"

  devise_for :users
  resources :users



  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
