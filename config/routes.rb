Iledocs::Application.routes.draw do
  resources :comments


  resources :tags


  match 'documents/test', to: 'documents#test'
  match 'documents/test/result', to: 'documents#parse_result'
  resources :documents


  resources :attributes



  root :to => "home#index"



end
