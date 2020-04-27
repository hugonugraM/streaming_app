Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :contents, only: [:index]
  get 'contents/movies', to: 'contents#movies'
  get 'contents/seasons', to: 'contents#seasons'

  resources :users, only: [:library] do
    get 'library', to: 'users#library'
    resources :purchases, only: [:create]
  end
end
