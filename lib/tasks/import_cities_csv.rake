require 'csv'
namespace :import_cities_csv do
  task :create => :environment do
    csv_text = File.read('/Users/sh/fighter/cities - cities.csv')
	csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
	  City.create!(row.to_hash)
	end
  end
end 