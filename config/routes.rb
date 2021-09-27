Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homes
  root to: 'homes#top'
  get "home/about" => "homes#about"

  #users(relationships,rate_graph_comments,favoritesネスト)
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    resources :rate_graph_comments, only: [:create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    post '/' => 'users#create', as: 'comments'
    delete '/' => 'users#destroy', as: 'comment'
  end

  #rate_graphs
  resources :rate_graphs, only: [:index, :create, :edit, :update]

  #search
  get '/search', to: 'searches#search'

end
