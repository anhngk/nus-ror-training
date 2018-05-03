- app: Folder chứa phần lớn source code mà ta sẽ viết cho chương trình follow theo mô hình MVC
- assets: Chứa các thành phần hỗ trợ cho View như images chứa hình ảnh, javascript chứa các file javascript, stylesheets chứa các file CSS
- controllers: Gồm các file controller định nghĩa cho chương trình
- helpers: Chứa các phương thức helper
- mailers: Các phương thức cho chức năng email của chương trình
- models: Những file định nghĩa model của từng controllers
- views: Chứa các view, layout hiển thị cho người dùng
- config: Chứa tất cả các file config của ứng dụng như kết nối database...
  + application.rb : Chứa những config chính cho chương trình như timzone, language,...
  + database.yml: Các config database cho các môi trường khác nhau như development, production, tét...
  + routes.rb: Tất các đường dẫn trong ứng dụng được định nghĩa ở đây
  + locales: Chứa các file language
  + initializers: Chứa các file cần thiết khi khởi tạo Rails
- db: Chứa lược đồ CSDL và các phiên bản migration
  + schema.rb: Lược đồ CSDL
  + migrate: Các phiên bản migrate
  + seeds: Các dữ liệu khi khởi tạo ứng dụng
- Gemfile & Gemfile.lock: File cho phép quản lý, thêm bớt các Gem trong ứng dụng Rails
- log: Chứa các file log
- public: Chứa những file thông dụng cho một ứng dụng web. Những file HTML templates cho các lỗi HTTP như 404, 422 và 500. favicon và robots.txt
- README: Bản tóm tắt hướng dẫn sử dụng cho ứng dụng.
- test: Những file test cho ứng dụng
- vendor: Chứa file code từ bên thứ ba như các thư viện css. Javascript..