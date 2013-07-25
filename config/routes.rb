Iledocs::Application.routes.draw do
  resources :comments


  resources :tags


  resources :documents


  resources :attributes


  root :to => "home#index"
end
