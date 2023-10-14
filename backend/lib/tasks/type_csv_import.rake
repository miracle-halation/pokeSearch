namespace :type_csv do
	desc "Import Type CSV data"
	task import: :environment do
		require 'csv'

    csv_file = 'lib/csv/typeindex.csv'  # CSVファイルのパスを指定
    data = CSV.read(csv_file, encoding: 'UTF-8', headers: true)  # CSVデータを読み込む

    data.each do |row|
      # ここで各行のデータを整形して処理する
      formatted_data = {
        name: row
      }

      # データをインポートする処理を行う（例えばモデル.createなど）
      Type.create!(formatted_data)
    end
	end
end