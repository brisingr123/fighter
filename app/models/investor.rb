class Investor < ApplicationRecord
	has_and_belongs_to_many :companies
	has_and_belongs_to_many :investor_tags
	belongs_to :city, optional: true
end
