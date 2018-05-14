  Routing:

- index / show / edit / new / create / update / destroy

- index (GET - /photos/)
- new (GET - /photos/new)
- edit (GET - /photos/:id/edit)
- update (PATCH/PUT - /photos/:id)
- create (POST - /photos)
- show (GET - /photos/:id)
- destroy (DELETE - /photos/:id)

Định nghĩa RESTful?

Resource có id => member
resources :users do
  member do
    get 'like'
  end
end

OR

resources :photos do
  get 'preview', on: :member
end

Resource không id => collection

resources :photos do
  collection do
    get 'search'
  end
end

OR

resources :photos do
  get 'search', on: :collection
end

Route /articles (without the prefix /admin)

scope module: 'admin' do
  resources :articles, :comments
end

or single case
  resources :articles, module: 'admin'

scope '/admin' do
  resources :articles, :comments
end

or resources :articles, path: '/admin/articles'

- Shallow nesting :

    resources :articles, shallow: true do
      resources :comments
      resources :quotes
      resources :drafts
    end

- shallow_path => path
- shallow_prefix => helper

Adding member routes
  resources :photos do
    member do
      get 'preview'
    end
  end

- Redirection

  get '/stories', to: redirect('/articles')

Nested resource dùng để làm gì? => Khai báo đường dẫn cho các association
Theo đề nghị của Rails Guide thì chúng ta nên limit nested resource ở level thứ mấy (nên sử dụng bao nhiêu “resources” lồng nhau)? => Level 1, chỉ một resources lồng trong 1 resources khác


resources :posts do
  resources :comments
end

GET /posts/:post_id/comments post_comments_path
PATCH/PUT /post/:post_id/comments/:id  post_comments_path(:id)

get 'exit', to: 'sessions#destroy' => sẽ gọi đến sessions#destroy khi nhận được url /exit
get 'exit', to: 'sessions#destroy', as: :logout => tạo ra 2 helper logout_path và logout_url, gọi logout_path sẽ trả về /exit

match 'exit',  to: 'user#logout',  via: [:get, :post, :patch]


Làm cách nào để ngăn chặn access các ip address nằm trong mảng sau bằng cách khai báo route ?
[192.168.1.56, 424.235.42.22]
Khi các ip address này request, sẽ được điều hướng sang controller commons, action not_permit

Rails.application.routes.draw do
  match '*path', to: 'commons#not_permit', via: :all,
  constraint: lambda { |request| [192.168.1.56, 424.235.42.22].include?(request.remote_ip) }
end

  match '*path', to: 'commons#not_permit' via: :all,
  constraint: lambda { |request| [192.168....].include?(request.remote_ip)}
  constraint: lambda { |request| [192lll].include?(request.remote_ip)}

  constraint: lambda { |request| [129.2232].include?(request.remote_ip)}
  match '*path', to: 'commons#not_permit' via: :all


resource :abc
resolve('Abc') { [:abc] }

scope '/admin' do
  resource :articles, :comments
end

resources :articles, path: '/admin/articles'

-------------------------

GET /users/:user_id/posts 'posts#index' user_posts_path

GET /users/:user_id/posts/:id 'posts#show' user_posts_path(:id)

GET /users/:user_id/posts/:id/edit 'posts#edit' edit_user_posts_path(:id)

GET /users/:user_id/posts/new 'posts#new' new_user_posts_path

POST /users/:user_id/posts/ 'posts#create' user_posts_path

PUT/PATCH /users/:user_id/posts/:id 'posts#update' user_posts_path(:id)

DELETE /users/:user_id/posts/:id 'posts#destroy' users_posts_path(:id)



root 'users#index'

get 'users/:id/like/:post_id', to: 'users#like'

resources :users do
  member do
    get 'like'
  end
end

---------------------------------------

resources :users, path: 'admin/users'
resources :users, module: 'admin'

1. admin/users => users

resources :users, path: 'admin/users'

2. /users => admin/users

resources :users, module: 'admin'


---------------------------------------

URL vs Path


---------------------------------------

admin/articles => /articles
  Multiple case
    scope module :admin do
        resources :articles
    end
  Single case
    resources :articles, module: 'admin'

/admin/articles => ArticlesController without prefix
  scope 'admin' do
    resources :articles
  end

Single case => resources :articles, path: 'admin/articles' => admin/articles - articles#index - articles_path

---------------------------------------

/photos/1/preview => Add member route

resources :photos do
  member do
    get 'preview'
  end
end

resources :photos do
  get 'preview', on: :member
end

/photos/search

resoures :photos do
  collection do
    get 'search'
  end
end

resources :photos do
  get 'search', on: :collection
end

---------------------------------------

/photos/new/preview

resources :photos do
  get 'preview', on: :new
end

---------------------------------------

get '/photos(/:id)', to: :display

---------------------------------------

match '/photos', to: 'photos#index', via: [:get, :post]

---------------------------------------

match 'photos', to: 'photos#show', via: [:all]

---------------------------------------

Redirection

get 'stories', to: redirect('/artiles')
get 'stories/:name', to: redirect('/articles/%{name}')

---------------------------------------

resource :basket
resolve ("Basket") {[:basket]}

---------------------------------------

Overriding the new and edit segments

resources :photos, path_names: {new: 'make', edit: 'change'}

Overrding named helper

resources :photos, as: 'images'

------------------------------------

Translated paths

scope (path_names: {new: new, edit:'bearbeiten'}) do
  resources :categories, path: 'kategorien'
end

