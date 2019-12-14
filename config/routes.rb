Rails.application.routes.draw do
  get 'education/index'
  resources :articles
  resources :categories
  devise_for :administrateurs
  devise_for :auteurs
	root "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
