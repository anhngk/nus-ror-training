authentication là xác thực xem người dùng có tồn tại trong hệ thống không
authorization là kiểm tra xem người dùng có được phép truy cập vào khu vực hay tài nguyên nào đó không

B1: rails generate devise:install => Cài đặt các tùy chọn cấu hình của Devise
B2: rails generate devise User => Tạo ra một file migrate để tạo table users với các trường mặc định của Devise như :email :encrypted_password :sign_in_count :current_sign_in_at ...
Đồng thời tạo ra một file model user.rb với devise method để thiết lập các chức năng của devise mà ta muốn sử dụng
B3: rake db:migrate => Chạy migration để update schema

Database Authenticatable => Băm và lưu mật khẩu vào database để xác thực người dùng khi đăng nhập
Registerable => Xử lý việc đăng ký cũng như sửa và xóa account
Recoverable => Reset password và gửi hướng dẫn reset password cho user
Confirmable => Gửi email với hướng dẫn xác nhận đăng ký tài khoản tới user
Rememberable => Tạo hoặc xóa token để nhớ user được lưu ở cookie


devise_scope :user do
 get 'sign_in', to: 'devise/session#new'
end

Kế thừa lại SessionsController

class Users::SessionsController < Devise::SessionsController
 def create
  do_something_different
 end
end

devise_parameter_sanitizer.permit()