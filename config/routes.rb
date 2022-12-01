Rails.application.routes.draw do
  resources :blogs do
    resources :comments, shallow: true, only: [:create, :edit, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
