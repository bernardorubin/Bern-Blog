Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'home#index'
  # get '/posts/:id' => 'posts#show', as: :post

  resources :posts, shallow: true do
    resources:comments, only:[:create, :destroy]
    resources:categories, only:[:create, :destroy]
  end
  
end
