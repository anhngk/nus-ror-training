  Routing:

- index / show / edit / new / create / update / destroy

- index (GET - /photos/)
- new (GET - /photos/new)
- edit (GET - /photos/:id/edit)
- update (PATCH/PUT - /photos/:id)
- create (POST - /photos)
- show (GET - /photos/:id)
- destroy (DELETE - /photos/:id)

Route /articles (without the prefix /admin)

scope module: 'admin' do
  resources :articles, :comments
end

or single case
  resources :articles, module: 'admin'

scope '/admin' do
  resources :articles, :comments
end

or resources: :articles, path: '/admin/articles'

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

Nested resource dùng để làm gì? => Khai báo đường dẫn cho các asociation
Theo đề nghị của Rails Guide thì chúng ta nên limit nested resource ở level thứ mấy (nên sử dụng bao nhiêu “resources” lồng nhau)? => Level 1, chỉ một resources lồng trong 1 resources khác


resources :posts do
  resources :comments
end

GET /posts/:post_id/comments post_comments_path
PATCH/PUT /post/:post_id/comments/:id  post_comments_path(:id)

get 'exit', to: 'sessions#destroy' => sẽ gọi đến sessions#destroy khi nhận được url /exit
get 'exit', to: 'sessions#destroy', as: :logout => tạo ra 2 helper logout_path và logout_url, gọi logout_path sẽ trả về /exit

match 'exit',  to: 'user#logout',  via: [:get, :post, :patch]