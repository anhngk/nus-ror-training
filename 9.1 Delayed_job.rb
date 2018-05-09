- What is it?
Delayed_job là một asynchronously background processing. Được sử dụng khi bạn muốn xử lý các tác vụ có thời gian thực thi lâu hoặc các tác vụ sẽ được chạy trong tương lai

- Làm sao set queue adapter là delayed_job trong Rails 4.2 trở lên?
config.active_job.queue_adapter = :delayed_job

- Làm sao delete hết tất cả các jobs hiện có trong DelayedJob?
rake jobs:clear

- Dùng câu lệnh rake nào để start worker cho delay job?
rake jobs:work

-Viết command để start delayed_job với môi trường production trong rails 4
RAILS_ENV=production bin/delayed_job start