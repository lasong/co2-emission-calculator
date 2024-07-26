Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'emissions#index' # Set the root path to the index action
  resources :emissions, only: [:new, :create, :show, :index]
end
