email = "test@example.com"
password = "password"
admin_email = "admin@example.com"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

# 条件を指定して最初の１件を取得、１件もなければ作成
AdminUser.find_or_create_by!(email: admin_email) do |admin_user|
  admin_user.password = password
  puts "CSVファイルのインポートをしました"
end

# texts, movies テーブルを再生成（関連付くテーブルを含む）
%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

# ImportCsvクラスを読み込む
require "import_csv"
# CSVファイルのインポート/lib/import_csv.rbに処理を記述
ImportCsv.text_data
ImportCsv.movie_data
