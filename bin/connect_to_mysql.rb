require 'mysql2'

# MySQL データベースに接続
client = Mysql2::Client.new(
  host: "localhost",  # ホスト名
  username: "root",   # ユーザー名
  password: "", # パスワード
  database: "kairanban_development"  # データベース名
)

tables = client.query("SHOW TABLES")
table_names = tables.map { |table| table.values.first }

# クエリを実行して結果を取得
table_names.each do |table_name|
  results = client.query("SELECT * FROM accesses")
  puts "Data from table accesses"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM active_storage_attachments")
  puts "Data from table active_storage_attachments"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM active_storage_blobs")
  puts "Data from table active_storage_blobs"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM ar_internal_metadata")
  puts "Data from table ar_internal_metadata"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM meetings")
  puts "Data from table meetings"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM news")
  puts "Data from table news"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM posts")
  puts "Data from table posts"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM schema_migrations")
  puts "Data from table schema_migrations"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM stamps")
  puts "Data from table stamps"
  results.each do |row|
    puts row.inspect
  end

  results = client.query("SELECT * FROM users")
  puts "Data from table users"
  results.each do |row|
    puts row.inspect
  end
end

# 接続を閉じる
client.close
