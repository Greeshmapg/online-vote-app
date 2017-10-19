Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :nominees

  resources :users do
    collection do
      post 'invite_user', to: 'users#invite_user'
      get 'history', to:'users#history'

    end
  end

  get 'invite', to: 'users#invite'
  get 'voting_page', to: 'users#voting_page'

  resources :categories do
    member do
      post 'like', to: "nominees#like"
      delete 'remove_nominee', to:"categories#remove_nominee"
    end
  end

  get 'result', to:"categories#result"
  get 'nominee_list' ,to: "nominees#nominee_list"
  get 'winner_show', to: "categories#winner_show"
  get 'check_category', to: "categories#check_category"
  get 'check_nominee', to: "nominees#check_nominee"
  get 'profile', to:"nominees#profile"
  get 'pdf_result', to:"categories#pdf_result"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
