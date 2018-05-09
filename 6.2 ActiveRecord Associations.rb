Association:

LƯU Ý :

:source tương tự như :class_name nhưng sử dụng với mqh has_many/has_one through: và có class_name khác nhau

//////////
- Với belongs_to : Khi thực hiện một thay đổi => phải call save mới thực hiện (a.user = User.find(1) => a.save)
- Với các mối quan hệ khác : Thay đối => autosave (u.accounts << Account.find(2))
//////////

has_many through: tạo ra một bảng trung gian khi liên kết giữa hai model
has_and_belongs_to liên kết trực tiếp hai model

Sử dụng has_many through: khi cần nơi để xử lý data trên dữ liệu liên kết giữa hai model/validation
Sử dụng has_and_belongs_to_many khi cần gọn nhẹ, quy mô nhỏ, không xử lý nhiều

Conditions: where/extending/group/include/limit/offset/order/readonly/select/distinct

class User < ApplicationRecord
 has_many :posts
end

class Post < ApplicationRecord
 belongs_to :user, class_name: "User", foreign_key: "people_id"
end

Với association: @post = @user.posts.create()
Không dùng association: @post = Post.create(user_id: @user.id)

Với association: @user.detroy
Không association:
@posts = Post.where(user_id: @user.id)
@posts.each do |post|
 post.destroy
end
@user.destroy

has_many :books , -> { where printed: true }

class Author < ApplicationRecord
has_many :books, { order "pusblished_at DESC" }
end

Chỉ định class sẽ lấy dữ liệu trong polymorphic association

class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :books, :through => :taggings, :source => :taggable, :source_type => "Book"
  has_many :movies, :through => :taggings, :source => :taggable, :source_type => "Movie"
end

class Tagging < ActiveRecord::Base
  belongs_to :taggable, :polymorphic => true
  belongs_to :tag
end

class Book < ActiveRecord::Base
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
end

class Movie < ActiveRecord::Base
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
end

Lấy ra các bộ phim có Tag là action
tag = tag.find_by_name("action")
tag.movies

Khi xóa Author sẽ xóa luôn các cuốn sách thuộc về Author đó
delete_all : xóa tất cả associated object ra khỏi database và không thể thực hiện callback
nullify : set foreign_key thành NULL, callback không thể thực hiện
restrict_with_exception : raise một exception khi tồn tại bất cứ asscociated record
restrict_with_error : nếu có record liên kết, sẽ thêm một error cho người sở hữu

assemblies_parts => thứ tự theo alphabet

class Assembly < ApplicationRecord
has_and_belongs_to_many :parts, join_table: this_is_the_name
end

class Part < ApplicationRecord
has_and_belongs_to_many :assemblies, join_table: this_is_the_name
end
end

class Employee < ApplicationRecord
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"

  belongs_to :manager, class_name: "Employee"
end

Quan hệ polymorphic :

  Define

  class Image < ...
    belongs_to :imageable, polymorphic: true
  end

  class User < ...
    has_many: :images, as: :imageable
  end

  Trong file migrate thêm reference
    t.references :imageable, polymorphic: true, index: true

  Database thêm 2 field
    imageable_type : tên model sử dụng
    imageable_id : id của instance sở hữu


Association Reference :

1.  belongs_to
 -  association (@author = @book.author) trả về association object, nếu không có trả về nil

 -  reload_association (@author = @book.reload_author) nếu association object đã được gọi từ database, thông tin lưu trong cached sẽ được gọi. Nếu muốn reload lại => gọi reload_association

 -  association = (associate) (@book.author = @author) Sẽ gán đối tượng @author cho @book.author. Lấy primary key của @author gán cho foreign_key của @book

 -  build_association(attributes={}) (@author = @book.build_author(author_number: 123, author_name: "John ABC")) build_association trả về một object mới của author, được khỏi tạo với các tham số truyền vào, cũng như thiết lập foreign_key nhưng object vẫn chưa được save

 -  create_association (@author = @book.create_author(author_number: 123,
                                   author_name: "John Doe"))
    tương tự build nhưng nếu pass tất cả validation => save

 -  create_association! (attributes = {}) => Thực hiện tương tự như create_association nhưng raises ActiveRecord::RecordInvalid nếu record invalid

 :autosave
 :class_name
 :counter_cache cache lại counter của object


 has_one :account, class_name: "MyApplication::Billing::Account"