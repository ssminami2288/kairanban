require 'mysql2'

# MySQL データベースに接続
client = Mysql2::Client.new(
  host: "localhost",  # ホスト名
  username: "root",   # ユーザー名
  password: "password", # パスワード
  database: "dbname"  # データベース名
)

# クエリを実行して結果を取得
results = client.query("SELECT * FROM table_name")

# 結果を表示
results.each do |row|
  puts row
end

# 接続を閉じる
client.close
