class Investor < ApplicationRecord
	has_and_belongs_to_many :companies
	has_and_belongs_to_many :investor_tags
end
