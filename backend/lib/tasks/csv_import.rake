namespace :csv do
	desc "Import CSV data"
	task import: :environment do
		require 'csv'

    csv_file = 'lib/csv/pokemon_status.csv'  # CSVファイルのパスを指定
    data = CSV.read(csv_file, encoding: 'Shift_JIS', headers: true)  # CSVデータを読み込む

    data.each do |row|
      # ここで各行のデータを整形して処理する
      formatted_data = {
        pokemon_id: row['図鑑番号'],
        name: row['ポケモン名'],
        type1: row['タイプ１'],
        type2: row['タイプ２'],
        avility1: row['通常特性１'],
        avility2: row['通常特性２'],
        hidden_avility: row['夢特性'],
        hp: row['HP'],
        attack: row['こうげき'],
        block: row['ぼうぎょ'],
        contact: row['とくこう'],
        diffence: row['とくぼう'],
        speed: row['すばやさ'],
      }

      # データをインポートする処理を行う（例えばモデル.createなど）
      Pokemon.create!(formatted_data)
    end
	end
end