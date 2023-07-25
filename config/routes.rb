Rails.application.routes.draw do
  get 'admin/index'
  root "articles#index"
  # get 'articles',to: "articles#index"
 
  # get "/articles/:id", to: "articles#show"
  
  get 'admin/index'
  post 'admin/index'
  get 'admin/logout'
  resources :articles do
    resources:comments
  end
end
