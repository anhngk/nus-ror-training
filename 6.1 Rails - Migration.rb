Migration:

- Rollback n version migrate: rake db:rollback STEP=3
- Run specify migrate version: rake db:migrate VERSION=<version-number>
- Table schema_migration : List những migration đã chạy - Nếu migration không có trong List -> run
- foreign_key: true/false : True -> Không thể xóa data khi có reference
- Rename column : rename_column :users, :oldname, :newname
- Khi chạy rake db:migrate sẽ invoke db:schema:dump -> update schema

def change
  change_column :users, :age, :string
end