Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'home#index', as: :root
  # get '/posts/:id' => 'posts#show', as: :post

  resources :posts, shallow: true do
    resources:comments, only:[:create, :destroy]
    resources:categories, only:[:create, :destroy]
  end


  resources :users, only:[:new, :create]
  resources :sessions, only:[:new, :create] do
            # what is this ?   👇
    delete :destroy, on: :collection
  end

end
