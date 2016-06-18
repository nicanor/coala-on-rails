Rails.application.routes.draw do

  scope module: :admin do
    resources :users
    resources :documents do
      get 'image', on: :member
      resources :attachments #, shallow: true
    end
    resources :sites
    get 'profile', to: 'users#profile'
    patch 'update_profile', to: 'users#update_profile'
  end


  get  'login', to: 'login#log_in'
  post 'login', to: 'login#submit'
  get 'logout', to: 'login#log_out'


  scope module: :public do

    resources :articles , path: 'articulos'
    resources :recipes  , path: 'recetas'
    resources :resources, path: 'recursos' do
    # TODO:  get :download, on: :member
    end

    get :not_found,
      to: 'public#not_found',
      as: :not_found

    get '/:id', to: 'pages#show', as: :page

    root 'public#home'
  end

  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
end