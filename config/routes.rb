Rails.application.routes.draw do
  resources :articles, param: :slug
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'search', to: 'search#search'

  get '/:slug', to: 'articles#show'

  root to: 'search#search'
end
