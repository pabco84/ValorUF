class Uf < ApplicationRecord
    def self.load_csv_data
		file = File.open('tmp/uf.csv')
		file_data = file.readlines.map(&:chomp)
		file_data.each_with_index do |row, index|
			next if index.zero?
			cols = row.split(",")
			Uf.create(day: "2021/01/#{cols[0]}", value: cols[1])
            Uf.create(day: "2021/02/#{cols[0]}", value: cols[2]) if index <= 28
		end
	end
end
