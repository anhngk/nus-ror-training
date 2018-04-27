  QueryInterface:

Class Product < ApplicationRecord
 scope :active { where(active: true) }
end

- Truyền gì vào params :order để gây ra SQL injection? => ' OR -- '/
- Hàm includes với hàm joins khác nhau chỗ nào?
- N + 1 query là gì? làm thế nào để tránh?
- Ý nghĩa của hàm .references và cho ví dụ
- Phân biệt left join và inner join

Client.where("first_name LIKE ?", params[:first_name])
Client.where("created_at >= :start_date AND created_at <= :end_date", {start_date: params[:start_date], end_date: params[:end_date]})

length sẽ load tất cả các object lên để đếm
count sẽ thực hiện việc đếm ở database
size sẽ kiểm tra xem object đã được load lên chưa, nếu true => trả về length mà không phải gọi tới database.Nếu false size sẽ kiểm tra counter_cache (nếu có). Nếu tất cả đều false size sẽ gọi đến count

distinct
offset



Context: User có nhiều bài post, 1 bài post có nhiều comment, 1 bài post có 1 column là lượt like (like_num)
1. Làm sao lấy ra tất cả User có post                       User.joins(:posts)
2. Làm sao lấy ra tất cả User có hoặc không có post đều đc  User.left_outer_joins(:posts)
3. Lấy tất cả User có bài post có like_num > 2              User.joins(:posts).where("posts.like_num > 2")
4. User.all.each do |u|
  puts u.posts
end

--> N + 1 query
Gỉai thích + Giải pháp
  Query ra tất cả user sau đó lấy ra các post của từng user đó
  => Dùng eager load : User.includes(:posts)


User.all.each do |u|
  u.posts.each do |p|
    puts p.comments
  end
end

--> N*M + 1 query
Gỉai thích + Giải pháp
Đầu tiên query ra tất cả user sau đó ở từng object user query ra tất cả các post rồi tiếp tục query để puts được các comment trong từng post
=> Dùng eager load : User.includes(post: :comments)

5. Cùng ngữ cảnh câu 4. Làm sao include được các bài post có like_num > 2
=> User.includes(:posts).where("posts.like_num > 2").references(:posts)

Trường hợp query trả về Array/nil/ActiveRelation/ActiveRelation nil

-----------------------------

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