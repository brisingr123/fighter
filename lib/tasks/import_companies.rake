require 'csv'
namespace :import_companies_csv do
  task :create => :environment do
    csv_text = File.read(File.join(Rails.root,'Landscape - Company Details.csv'))
	csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
	  Company.create!(row.to_hash)
	end
  end
end 