Rails.application.routes.draw do
  root 'announcements#homepage'
  resources :categories
  devise_for :users


  resources :announcements do
    collection do
      get 'homepage'
      post 'homepage'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
