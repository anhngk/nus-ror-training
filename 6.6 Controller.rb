  Controller:

- 2 kinds of parameter :
  + Query string parameters : everything after "?" in the URL
  + POST data

@post = Post.create(user_id = @user.id)
post = Post.where(user_id: 5)

params.require(:person).permit(:name, :age)

Session:
ActionDispatch::Session::CookieStore - Stores everything on the client.
ActionDispatch::Session::CacheStore - Stores the data in the Rails cache.
ActionDispatch::Session::ActiveRecordStore - Stores the data in a database using Active Record. (require activerecord-session_store gem).
ActionDispatch::Session::MemCacheStore - Stores the data in a memcached cluster (this is a legacy implementation; consider using CacheStore instead).

skip_before_action :authentication, only: [:new]


Làm sao để giữ flash lại khỏi bị xóa ở request tiếp theo? flash.keep

Làm thế nào để expire tất cả session?
ActiveRecord::SessionStore::Session.delete_all
ActiveRecord::SessionStore::Session.where(["updated_at < ?", 2.weeks.ago]).delete_all


<%= options_from_collection_for_select(users, :name) %>

 $("#notifications").append("<%= escape_javascript(render(:partial => 'layouts/notification')) %>");

