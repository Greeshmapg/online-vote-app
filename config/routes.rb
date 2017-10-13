Rails.application.routes.draw do
  devise_for :users
  root 'users#index'


resources :users do
  collection do
    post 'invite_user', to: 'users#invite_user'

  end
end

  get 'invite', to: 'users#invite'
 get 'voting_page', to: 'users#voting_page'

resources :categories do
  member do
    post 'like', to: "nominees#like"
    delete 'unlike/:id', to: "nominees#unlike"
  end
end

resources :nominees do
  member do

  end
end

get 'nominee_list' ,to: "nominees#nominee_list"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
