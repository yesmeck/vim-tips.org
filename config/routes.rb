Vimtips::Application.routes.draw do

  root :to => 'home#index'

  mount RailsAdmin::Engine => '/bazinga', :as => 'rails_admin'

  devise_for :users

  match 'post' => 'tips#new'
  match 'tips/random' => 'tips#random'
  match 'plugin' => 'home#plugin'
  match 'about' => 'home#about'
  match 'random' => 'home#random'
  match 'feed' => 'tips#feed',
        :as => :feed,
        :defaults => { :format => 'atom' }

  resources :tips

end
