  QueryInterface:

reorder / reverse_order

Sự khác biệt giữa User.find([1,2]) và User.where id:[1,2] là
- User.find([1,2]) => Raise exception RecordNotFound
- User.where id:[1,2] => ActiveRecord::Relation Array rỗng

Sự khác biệt giữa User.all / User.find_each / User.find_in_batches
- User.all Load tất cả các User lên cùng lúc
- User.find_each Load lần lượt các batches user theo 1 batch_size, truyền lần lượt từng user trong batch vào block
- User.find_in_batches Load lần lượt các batches user theo 1 batch_size, truyền nguyên user_batch vào block

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
2. Làm sao lấy ra tất cả User có hoặc không có post đều đc  User.all / User.includes(:posts)
3. Lấy tất cả User có bài post có like_num > 2              User.joins(:posts).where("posts.like_num > 2")
4. User.all.each do |u|
  puts u.posts
end

--> N + 1 query
Gỉai thích + Giải pháp
  Query ra tất cả user sau đó lấy ra các post của từng user đó
  => Dùng eager load : User.includes(:posts)

//////////
  @users = User.includes(:posts)
  @users.each do |u|
    puts u.posts
  end
//////////

User.all.each do |u|
  u.posts.each do |p|
    puts p.comments
  end
end

--> N*M + 1 query
Gỉai thích + Giải pháp
Đầu tiên query ra tất cả user sau đó ở từng object user query ra tất cả các post rồi tiếp tục query để puts được các comment trong từng post
=> Dùng eager load : User.includes(posts: :comments)
//////////
  @users = User.includes(posts: :comments)
  @users.each do |u|
    u.posts.each do |p|
      puts p.comments
    end
  end
//////////

5. Cùng ngữ cảnh câu 4. Làm sao include được các bài post có like_num > 2
=> User.includes(:posts).where("posts.like_num > 2").references(:posts)

Trường hợp query trả về Array/nil/ActiveRelation/ActiveRelation nil


Scope:

class Article < ApplicationRecord
  scope :published, -> {where( published: true )}
  scope :created_before, -> (time) { where("created_at < ?", time) if time.present? }
  default_scope { where( active: true )}
end


def self.created_before(time)
  where("created_at < ?", time)
end

resources :users do
  resources :posts
end

find_or_create_by()
create_with().find_or_create_by()

class Article < ApplicationRecord
  scope :published, -> { where(published: true) }
  default_scope { where (active: true )}
  scope :created_before, ->(time) {where("created_at < ?", time)}
end

Conditions

- Pure String Conditions
  Client.where("order_count='2'")

- Array Conditions
  Client.where("orders_count=?", params[:order])
  Client.where("orders_count= ? AND status = ?", params[:orders], params[:status])

- Placeholder Conditions
  Client.where("created_at >= :start_date AND created_at <= :end_date",{start_date: params[:start_date], end_date: params[:end_date]})

- Hash Conditions
  Client.where('locked' => true)
  Client.where(locked: true)
  Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
  Client.where(orders_count: [1,4,6])

- Not Conditions
  Client.where.not(locked: true)

- Or Conditions
  Clients.where(locked: true).or(Clients.where(orders_count: [5,6]))


---------------------------

Array conditions

Client.where("orders_count = ?", params[:order])
Client.where("privacy = ? AND status = ?", params[:privacy], params[:status])

Hash conditions

Client.where(active: true)
Client.where('active' => true)
Client.where(orders_count: [32,43,55])

String conditions
Client.where("orders_count >= '2'")
Client.where("orders_count >= #{params[:orders]}")

