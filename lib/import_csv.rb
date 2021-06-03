require "csv"

class ImportCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    # インポートするデータを格納するための空配列
    list = []
    # CSVファイルからインポートしたデータを格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    # メソッドの戻り値をインポートしたデータの配列とする
    list
  end

  def self.user_data
    # importクラスメソッドを呼び出し，ユーザーデータの配列を生成
    list = import("db/csv_data/user_data.csv")

    puts "インポート処理を開始"
    User.create!(list)
    puts "インポート完了!"
  end
end
