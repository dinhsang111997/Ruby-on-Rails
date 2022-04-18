# Rails.application.routes.draw do
#   devise_for :users
#   resources :courses
#   root 'home#index'
#   # get 'static_pages/landing_page'
#   # get 'static_pages/privacy_policy'
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# end
Rails.application.routes.draw do
  #  do
  # get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  devise_for :users
  resources :courses
    resources :users, only: [:index, :edit, :show, :update]
  get 'home/index'
  get 'home/activity'
  root 'home#index'
end
