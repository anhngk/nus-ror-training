Unit test là gì?

Là một đoạn code tự động kiểm tra bằng cách gọi và kiểm một gỉa định duy nhất về hành vi hoạt động của một unit of work

Một đơn vị công việc là một chức năng logic

Một Unit test tốt :
- Có khả năng hoàn toàn tự động
- Kiểm soát được tất cả các thành phần đang chạy
- Có thể chạy bất cứ lúc nào nếu là một trong số rất nhiều test khác
- Chạy trên memory
- Trả về kết quả nhất quán
- Chạy nhanh
- Kiểm tra một khái niệm logic duy nhất trong hệ thống
- Dễ đọc
- Dễ bảo trì
- Tin cậy

Thường là tự động nhưng có thể thực hiện thủ công
Cô lập một unit và xác thực tính đúng đắn của nó
Được tạo ra trước khi code được viết

Benefits
- Kiểm soát được chất lượng của chương trình
- Biết chính xác lỗi ở đâu
- Không xử lý data
- Giúp cho developer nghĩ về việc cấu trúc các hàm và object một cách đàng hoàng hơn (tốt hơn)
----------

RSpec là gì?
Là một testing framework cho Ruby

Basic structure of spec directory
Gồm 2 file spec_helper.rb và rails_helper.rb

Run RSpec : bundle exec rspec
Run only a subset of spec
  bundle exec rspec spec/models (run only model specs)
  bundle exec rspec spec/controllers/accounts_controller.spec.rb (run only for AccountsController)
  bundle exec rspec spec/controllers/accounts_controller.spec.rb:8 (run only spec line 8 of AccountsController)

What is expectation in rspec test ?
 Là kết quả mong đợi sẽ trả về của đoạn code

.to be
  expect(actual) to be(expected) => pass if actual.equal?(expected)

.to equal

.to match (RegularExpression)
  expect(actual).to match(/expression/)

.to be_truthy
  expect(actual).to be_truthy => pass if actual is truthy (not nil or false)

.to be_true
  expect(actual).to be true => pass if actual == true

.to be_falsey
  expect(actual).to be_falsey => pass if actual is falsey (nil or false)

.to be false
  expect(actual).to be false => pass if actual == false

.to be_nil
  expect(actual).to be nil => pass if actual is nil

.to_not be_nil
  expect(actual).to_not be_nil => pass if actual not nil

.to be_xxx
  expect(actual).to be_xxx => pass if actual.xxx?

to have_xxx
  expect(actual).to have_xxx(:arg) => pass if actual.has_xxx?(:arg)