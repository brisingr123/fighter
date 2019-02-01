require 'csv'    

csv_text = File.read('cities.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  City.create!(row.to_hash)
end