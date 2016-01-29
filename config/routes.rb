Rails.application.routes.draw do
  resources :calls
  resources :registrations
  resources :pins
  resources :lessons
  resources :audio_files
  resources :subjects
  get 'password_resets/new'
	get 'validatepin' => 'pins#validatepin'
	get 'validatelesson' => 'lessons#validatelesson'
  get 'password_resets/edit'

  get 'sessions/new'

	root 'static_pages#home'
  get 'signup' => 'users#new'
	get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
	resources :account_activations, only: [:edit]
	resources :password_resets,     only: [:new, :create, :edit, :update]

	namespace :api, defaults: { format: :json } do
 		scope module: :v1 do
      # We are going to list our resources here
    end 
  end
end
