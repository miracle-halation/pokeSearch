namespace :csv do
	desc "Import CSV data"
	task import: :environment do
		require 'csv'

    pokemon_csv_file = 'lib/csv/pokemon_status.csv'  # CSVファイルのパスを指定
    pokemon_data = CSV.read(pokemon_csv_file, encoding: 'Shift_JIS', headers: true)  # CSVデータを読み込む

    pokemon_data.each do |row|
      type_1 = Type.find_by(name: row['タイプ１'])
      type_2 = Type.find_by(name: row['タイプ２'])

      # ここで各行のデータを整形して処理する
      formatted_data = {
        pokemon_id: row['図鑑番号'],
        name: row['ポケモン名'],
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
      pokemon = Pokemon.create!(formatted_data)
      pokemon.types << type_1
      if type_2.present?
        pokemon.types << type_2
      else
        next
      end
    end
	end
end