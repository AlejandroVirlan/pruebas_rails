Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # /api/v1/
  namespace :api do
    namespace :v1 do
      resources :personas
      resources :comunicados
      resources :adjuntos      
      get '/notices', to: 'comunicados#show_notices'
      get '/creator-notices', to: 'comunicados#creator_notices'
      get '/reader-notices', to: 'comunicados#reader_notices'
      get '/threads', to: 'comunicados#show_threads'
    end
  end
end