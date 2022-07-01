Rails.application.routes.draw do
  resources :pictures do
    resources :comments
    member do
      get 'like', to: 'pictures#like'
      get 'unlike', to: 'pictures#unlike'
    end
  end
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pictures#index"
end
