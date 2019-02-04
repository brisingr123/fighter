require 'csv'
namespace :import_investors_csv do
  task :create => :environment do
    csv_text = File.read(File.join(Rails.root,'investors.csv'))
	csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
	  row = row.to_hash
	  name = row["name"]
	  city_name = row["location"]
	  mob = row["mob"]
	  website = row["webite"]
	  tag = row["type"]

	  investor = Investor.find_by(name: name)
	  city = City.find_by(name: city_name)
	  if !city
	  	city = City.create(name: city_name)
	  end

	  puts city.name
	  tag = InvestorTag.find_by(name: row["type"])
	  if !tag
	  	tag = InvestorTag.create(name: row["type"])
	  end
		puts tag.name
	  if investor
	  	investor.update(phone: mob, city_id: city.id, website: row["website"])
	  	investor.investor_tags << tag
	  else
	  	investor = Investor.create(name: name, phone: mob, city_id: city.id, website: row["website"])
	  	investor.investor_tags << tag
	  end
	end
  end
end 