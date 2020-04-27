Rails.application.routes.draw do

  devise_for :users
  root 'pages#index', as: 'home'

  get 'lookup' => 'pages#lookup'
  get 'about' => 'pages#about', as: 'about'
  get 'services' => 'pages#services', as: 'services'
  get 'contact' => 'pages#contact', as: 'contact'

  post "lookup" => 'pages#lookup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
